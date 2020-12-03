/*
 * Tencent is pleased to support the open source community by making Blueking Container Service available.,
 * Copyright (C) 2019 THL A29 Limited, a Tencent company. All rights reserved.
 * Licensed under the MIT License (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 * http://opensource.org/licenses/MIT
 * Unless required by applicable law or agreed to in writing, software distributed under,
 * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language governing permissions and
 * limitations under the License.
 */

package server

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"

	jsonpatch "github.com/evanphx/json-patch"
	"k8s.io/api/admission/v1beta1"
	k8sunstruct "k8s.io/apimachinery/pkg/apis/meta/v1/unstructured"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/apimachinery/pkg/runtime/serializer"

	"github.com/Tencent/bk-bcs/bcs-common/common/blog"
	"github.com/Tencent/bk-bcs/bcs-services/bcs-webhook-server/internal/pluginutil"
	"github.com/Tencent/bk-bcs/bcs-services/bcs-webhook-server/internal/types"
	"github.com/Tencent/bk-bcs/bcs-services/bcs-webhook-server/options"
)

var (
	runtimeScheme = runtime.NewScheme()
	codecs        = serializer.NewCodecFactory(runtimeScheme)
	deserializer  = codecs.UniversalDeserializer()

	// (https://github.com/kubernetes/kubernetes/issues/57982)
	defaulter = runtime.ObjectDefaulter(runtimeScheme)
)

// K8sHook do k8s hook
func (ws *WebhookServer) K8sHook(w http.ResponseWriter, r *http.Request) {
	if ws.EngineType == options.EngineTypeMesos {
		blog.Warnf("this webhook server only supports mesos log config inject")
		http.Error(w, "only support mesos log config inject", http.StatusBadRequest)
		return
	}
	var body []byte
	if r.Body != nil {
		if data, err := ioutil.ReadAll(r.Body); err == nil {
			body = data
		}
	}
	if len(body) == 0 {
		blog.Errorf("no body found")
		http.Error(w, "no body found", http.StatusBadRequest)
		return
	}

	// verify the content type is accurate
	contentType := r.Header.Get("Content-Type")
	if contentType != "application/json" {
		blog.Errorf("contentType=%s, expect application/json", contentType)
		http.Error(w, "invalid Content-Type, want `application/json`", http.StatusUnsupportedMediaType)
		return
	}

	var reviewResponse *v1beta1.AdmissionResponse
	ar := v1beta1.AdmissionReview{}
	if _, _, err := deserializer.Decode(body, nil, &ar); err != nil {
		blog.Errorf("Could not decode body: %s", err.Error())
		reviewResponse = pluginutil.ToAdmissionResponse(err)
	} else {
		reviewResponse = ws.doK8sHook(ar)
	}

	response := v1beta1.AdmissionReview{}
	if reviewResponse != nil {
		response.Response = reviewResponse
		if ar.Request != nil {
			response.Response.UID = ar.Request.UID
		}
	}

	resp, err := json.Marshal(response)
	if err != nil {
		blog.Errorf("Could not encode response: %v", err)
		http.Error(w, fmt.Sprintf("could encode response: %v", err), http.StatusInternalServerError)
		return
	}
	if _, err := w.Write(resp); err != nil {
		blog.Errorf("Could not write response: %v", err)
		http.Error(w, fmt.Sprintf("could write response: %v", err), http.StatusInternalServerError)
	}
}

func (ws *WebhookServer) doK8sHook(ar v1beta1.AdmissionReview) *v1beta1.AdmissionResponse {
	req := ar.Request
	plugins := ws.PluginMgr.GetKubernetesPlugins()
	pluginNames := ws.PluginMgr.GetKubernetesPluginNames()

	runtimeObj := req.Object
	if req.Operation == v1beta1.Delete {
		runtimeObj = req.OldObject
	}
	// decode object bytes
	tmpUnstruct := &k8sunstruct.Unstructured{}
	if err := json.Unmarshal(runtimeObj.Raw, &tmpUnstruct); err != nil {
		blog.Errorf("decode %s to unstructured object failed, err %s", string(runtimeObj.Raw), err.Error())
		return pluginutil.ToAdmissionResponse(
			fmt.Errorf("decode data to unstructured object failed, err %s", err.Error()))
	}
	tmpUnstructNs := tmpUnstruct.GetNamespace()
	// Deal with potential empty fields, e.g., when the pod is created by a deployment
	if tmpUnstructNs == "" {
		tmpUnstructNs = req.Namespace
	}

	// check if object in ignore namespaces should be hooked
	if types.IsIgnoredNamespace(tmpUnstructNs) {
		if value, ok := tmpUnstruct.GetAnnotations()[types.BcsWebhookAnnotationInjectKey]; ok {
			switch value {
			default:
				blog.V(5).Infof("ignored object %s/%s", tmpUnstruct.GetName(), tmpUnstruct.GetNamespace())
				return &v1beta1.AdmissionResponse{
					Allowed: true,
				}
			case "y", "yes", "true", "on":
				// do nothing, let it go
			}
		}
	}
	blog.Infof("object %s/%s hooked", tmpUnstruct.GetName(), tmpUnstruct.GetNamespace())

	var patches []types.PatchOperation
	// traverse each plugins
	for index, p := range plugins {
		annotationKey := p.AnnotationKey()
		// case 1: if plugin annotation key is empty, always pass object to plugin
		// case 2: if plugin annotation key is not empty, pass object to plugin if the object has the annotation key
		if len(annotationKey) != 0 {
			if _, ok := tmpUnstruct.GetAnnotations()[annotationKey]; !ok {
				continue
			}
		}
		blog.Infof("object %s/%s hooked by plugin %s",
			tmpUnstruct.GetName(), tmpUnstruct.GetNamespace(), pluginNames[index])
		// do webhook
		tmpResponse := p.Handle(ar)
		// when one plugin is not allowed, just return response
		if !tmpResponse.Allowed {
			return tmpResponse
		}
		if len(tmpResponse.Patch) != 0 {
			newPatches := make([]types.PatchOperation, 0)
			err := json.Unmarshal(tmpResponse.Patch, &newPatches)
			if err != nil {
				blog.Errorf("decode plugin patches failed, err %s", err.Error())
				return pluginutil.ToAdmissionResponse(
					fmt.Errorf("decode plugin patches failed, err %s", err.Error()))
			}
			patches = append(patches, newPatches...)
			// change the input for next plugin
			patchObj, err := jsonpatch.DecodePatch(tmpResponse.Patch)
			if err != nil {
				blog.Errorf("decode patch failed, err %s", err.Error())
				return pluginutil.ToAdmissionResponse(
					fmt.Errorf("decode patch failed, err %s", err.Error()))
			}
			modified, err := patchObj.Apply(req.Object.Raw)
			if err != nil {
				blog.Errorf("apply patch failed, err %s", err.Error())
				return pluginutil.ToAdmissionResponse(
					fmt.Errorf("apply patch failed, err %s", err.Error()))
			}
			req.Object.Raw = modified
		}
	}
	patchesBytes, err := json.Marshal(patches)
	if err != nil {
		blog.Errorf("encoding patches failed, err %s", err.Error())
		return pluginutil.ToAdmissionResponse(fmt.Errorf("encoding patches failed, err %s", err.Error()))
	}
	reviewResponse := v1beta1.AdmissionResponse{
		Allowed: true,
		Patch:   patchesBytes,
		PatchType: func() *v1beta1.PatchType {
			pt := v1beta1.PatchTypeJSONPatch
			return &pt
		}(),
	}
	return &reviewResponse
}
