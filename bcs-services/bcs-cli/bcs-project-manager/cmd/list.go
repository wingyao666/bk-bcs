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

package cmd

import (
	"context"

	"github.com/spf13/cobra"
	"k8s.io/klog"

	"github.com/Tencent/bk-bcs/bcs-services/bcs-cli/bcs-project-manager/cmd/printer"
	"github.com/Tencent/bk-bcs/bcs-services/bcs-cli/bcs-project-manager/pkg"
	"github.com/Tencent/bk-bcs/bcs-services/bcs-project-manager/proto/bcsproject"
)

func newListCmd() *cobra.Command {
	listCmd := &cobra.Command{
		Use:   "list",
		Short: "list infos from bcs-project-manager",
		Long:  "",
	}
	listCmd.AddCommand(listProjectsCmd())
	return listCmd
}

func listProjectsCmd() *cobra.Command {
	request := new(bcsproject.ListProjectsRequest)
	subCmd := &cobra.Command{
		Use:     "project",
		Aliases: []string{"projects", "p"},
		Short:   "list projects info with full-data or paging support",
		Long:    "",
		Run: func(cmd *cobra.Command, args []string) {
			cobra.OnInitialize(ensureConfig)
			ctx, cancel := context.WithCancel(context.Background())
			defer cancel()
			client, cliCtx, err := pkg.NewClientWithConfiguration(ctx)
			if err != nil {
				klog.Fatalf("init client failed: %v", err.Error())
			}
			resp, err := client.ListProjects(cliCtx, request)
			if err != nil {
				klog.Fatalf("list projects failed: %v", err)
			}
			if resp != nil && resp.Code != 0 {
				klog.Fatal("list projects response code not 0 but %d: %s", resp.Code, resp.Message)
			}
			printer.PrintProjectsListInTable(flagOutput, resp)
		},
	}
	subCmd.PersistentFlags().StringVarP(&request.ProjectIDs, "project_ids", "", "",
		"the project ids that query, multiple separated by commas")
	subCmd.PersistentFlags().StringVarP(&request.Names, "names", "", "",
		"the project chinese name, multiple separated by commas")
	subCmd.PersistentFlags().StringVarP(&request.ProjectCode, "project_code", "", "",
		"project code query")
	subCmd.PersistentFlags().StringVarP(&request.SearchName, "search_name", "", "",
		"project name used to fuzzy query")
	subCmd.PersistentFlags().StringVarP(&request.Kind, "kind", "", "",
		"the cluster kind")
	return subCmd
}
