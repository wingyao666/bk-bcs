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

package list

import (
	"fmt"
	"net/url"

	"bk-bcs/bcs-services/bcs-client/cmd/utils"
	"bk-bcs/bcs-services/bcs-client/pkg/storage/v1"
)

func listDeployment(c *utils.ClientContext) error {
	if err := c.MustSpecified(utils.OptionClusterID, utils.OptionNamespace); err != nil {
		return err
	}

	condition := url.Values{}
	condition.Add("namespace", c.Namespace())

	storage := v1.NewBcsStorage(utils.GetClientOption())
	list, err := storage.ListDeployment(c.ClusterID(), condition)
	if err != nil {
		return fmt.Errorf("failed to list deployment: %v", err)
	}

	return printListDeployment(list)
}

func printListDeployment(list v1.DeploymentList) error {
	if len(list) == 0 {
		fmt.Printf("Found no deployment\n")
		return nil
	}

	fmt.Printf("%-50s  %-15s  %-30s  %-30s %-30s\n",
		"NAME",
		"STATUS",
		"NAMESPACE",
		"APP_NAME",
		"APPEXT_NAME")
	for _, status := range list {
		appName := ""
		appExtName := ""
		if status.Data.Application != nil {
			appName = status.Data.Application.ApplicationName
		}
		if status.Data.ApplicationExt != nil {
			appExtName = status.Data.Application.ApplicationName
		}
		fmt.Printf("%-50s  %-15s  %-30s  %-30s %-30s\n",
			status.Data.ObjectMeta.Name,
			status.Data.Status,
			status.Data.ObjectMeta.NameSpace,
			appName,
			appExtName)
	}
	return nil
}
