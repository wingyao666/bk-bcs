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
	"github.com/emicklei/go-restful"
)

// EmptyResponse xxx
type EmptyResponse struct{}

// ErrorResponse xxx
type ErrorResponse struct {
	CodeName string `json:"code_name"`
	Message  string `json:"message"`
}

// ErrorRespWithStatus is useful for common helper functions
type ErrorRespWithStatus struct {
	Resp       *ErrorResponse
	StatusCode int
}

// WriteToResp xxx
func (resp *ErrorRespWithStatus) WriteToResp(response *restful.Response) {
	response.WriteHeaderAndEntity(resp.StatusCode, *resp.Resp)
}
