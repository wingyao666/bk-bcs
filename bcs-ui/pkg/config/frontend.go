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

// Package config xxx
package config

// HostConf :
type HostConf struct {
	DevOpsHost            string `yaml:"devops_host"`             // 蓝盾
	DevOpsBCSAPIURL       string `yaml:"devops_bcs_api_url"`      // SaaS Backend api 地址
	DevOpsArtifactoryHost string `yaml:"devops_artifactory_host"` // 制品库地址
	BKPaaSHost            string `yaml:"bk_paas_host"`            // PaaS 地址
	BKIAMAppURL           string `yaml:"bk_iam_app_url"`          // 权限中心
	BKCCHost              string `yaml:"bk_cc_host"`              // cmdb
	BKMonitorHost         string `yaml:"bk_monitor_host"`         // 蓝鲸监控
}

// FrontendConf
type FrontendConf struct {
	Docs map[string]string `yaml:"docs"`
	Host *HostConf         `yaml:"hosts"`
}

// defaultFrontendConf 默认配置
func defaultFrontendConf() *FrontendConf {
	c := &FrontendConf{
		Docs: map[string]string{},
		Host: &HostConf{},
	}
	return c
}
