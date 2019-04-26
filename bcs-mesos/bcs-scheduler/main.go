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

/*
Package main is the entry of scheduler process.

Implements of init log, init flags and start scheduler manager.
*/
package main

import (
	"bk-bcs/bcs-common/common"
	"bk-bcs/bcs-common/common/blog"
	"bk-bcs/bcs-common/common/conf"
	"bk-bcs/bcs-common/common/license"
	schedutil "bk-bcs/bcs-mesos/bcs-scheduler/src/util"
	"golang.org/x/net/context"
	"runtime"
)

func main() {

	runtime.GOMAXPROCS(runtime.NumCPU())

	op := &schedutil.SchedulerOptions{}
	conf.Parse(op)

	blog.InitLogs(op.LogConfig)
	defer blog.CloseLogs()

	if err := common.SavePid(op.ProcessConfig); err != nil {
		blog.Error("fail to save pid: err:%s", err.Error())
	}

	config := schedutil.NewSchedulerCfg()

	schedutil.SetSchedulerCfg(config, op)

	//license.CheckLicense()
	license.CheckLicense(op.LicenseServerConfig)

	scheduler, _ := NewScheduler(*config)
	scheduler.Start(context.Background())
}
