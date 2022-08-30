/*
 * Tencent is pleased to support the open source community by making Blueking Container Service available.
 * Copyright (C) 2019 THL A29 Limited, a Tencent company. All rights reserved.
 * Licensed under the MIT License (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 * http://opensource.org/licenses/MIT
 * Unless required by applicable law or agreed to in writing, software distributed under
 * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package types

import (
	"fmt"
	"github.com/Tencent/bk-bcs/bcs-common/common/deepcopy"
)

// CrrSpec xxx
// custom resource register spec
type CrrSpec struct {
	Names CrrSpecName `json:"names"`
}

// CrrSpecName xxx
type CrrSpecName struct {
	Kind string `json:"kind"`
}

// Crr xxx
// custom resource register
type Crr struct {
	TypeMeta `json:",inline"`
	Spec     CrrSpec `json:"spec"`
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *Crr) DeepCopyInto(out *Crr) {
	*out = *in
	out.Spec = in.Spec
	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new CrrSpec.
func (in *Crr) DeepCopy() *Crr {
	if in == nil {
		return nil
	}
	out := new(Crr)
	in.DeepCopyInto(out)
	return out
}

// Crd xxx
// custom resource definition
type Crd struct {
	TypeMeta   `json:",inline"`
	ObjectMeta `json:"metadata"`

	Spec interface{} `json:"spec"`

	Status interface{} `json:"status,omitempty"`
}

// DeepCopyInto is an autogenerated deepcopy function, copying the receiver, writing into out. in must be non-nil.
func (in *Crd) DeepCopyInto(out *Crd) {
	*out = *in
	out.TypeMeta = in.TypeMeta
	in.ObjectMeta.DeepCopyInto(&out.ObjectMeta)
	err := deepcopy.DeepCopy(out.Spec, in.Spec)
	if err != nil {
		fmt.Println("deepcopy Crd.Spec", in.NameSpace, in.Name, "failed", err.Error())
		return
	}

	err = deepcopy.DeepCopy(out.Status, in.Status)
	if err != nil {
		fmt.Println("deepcopy Crd.Status", in.NameSpace, in.Name, "failed", err.Error())
	}

	return
}

// DeepCopy is an autogenerated deepcopy function, copying the receiver, creating a new BcsServiceSpec.
func (in *Crd) DeepCopy() *Crd {
	if in == nil {
		return nil
	}
	out := new(Crd)
	in.DeepCopyInto(out)
	return out
}
