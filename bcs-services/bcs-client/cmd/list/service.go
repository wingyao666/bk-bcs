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

func listService(c *utils.ClientContext) error {
	if err := c.MustSpecified(utils.OptionClusterID, utils.OptionNamespace); err != nil {
		return err
	}

	condition := url.Values{}
	condition.Add("namespace", c.Namespace())

	storage := v1.NewBcsStorage(utils.GetClientOption())
	list, err := storage.ListService(c.ClusterID(), condition)
	if err != nil {
		return fmt.Errorf("failed to list service: %v", err)
	}

	return printListService(list)
}

func printListService(list v1.ServiceList) error {
	if len(list) == 0 {
		fmt.Printf("Found no service\n")
		return nil
	}

	fmt.Printf("%-50s  %-30s  %-30s  %-30s\n",
		"NAME",
		"NAMESPACE",
		"CLUSTER",
		"BCSGROUP")
	for _, status := range list {
		fmt.Printf("%-50s  %-30s  %-30s  %-30s\n",
			status.Data.ObjectMeta.Name,
			status.Data.ObjectMeta.NameSpace,
			status.Data.ObjectMeta.Labels["io.tencent.bcs.cluster"],
			status.Data.ObjectMeta.Labels["BCSGROUP"])
	}
	return nil
}
