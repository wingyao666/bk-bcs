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

package main

import (
	"fmt"
	"os"
	"runtime"

	"github.com/Tencent/bk-bcs/bcs-common/common/blog"
	"github.com/Tencent/bk-bcs/bcs-common/common/conf"
	"github.com/Tencent/bk-bcs/bcs-services/bcs-upgrader/app"
	"github.com/Tencent/bk-bcs/bcs-services/bcs-upgrader/app/options"
)

func main() {
	runtime.GOMAXPROCS(runtime.NumCPU())

	options.AddFlags()
	op := options.NewUpgraderOptions()
	conf.Parse(op)

	blog.InitLogs(op.LogConfig)
	defer blog.CloseLogs()

	blog.Info("bcs-upgrader starting...")
	if err := app.Run(op); err != nil {
		fmt.Fprintf(os.Stderr, "%v\n", err)
		os.Exit(1)
	}
	blog.Info("bcs-upgrader running now.")
}
