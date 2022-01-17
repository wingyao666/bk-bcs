/*
 * Tencent is pleased to support the open source community by making Blueking Container Service available.
 * Copyright (C) 2022 THL A29 Limited, a Tencent company. All rights reserved.
 * Licensed under the MIT License (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * 	http://opensource.org/licenses/MIT
 *
 * Unless required by applicable law or agreed to in writing, software distributed under,
 * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language governing permissions and
 * limitations under the License.
 */

package util

import (
	"strings"
)

// SplitString 分割字符串，支持 " ", ";", "," 分隔符
func SplitString(originStr string) []string {
	originStr = strings.ReplaceAll(originStr, ";", ",")
	originStr = strings.ReplaceAll(originStr, " ", ",")
	return strings.Split(originStr, ",")
}

// Partition 从指定分隔符的第一个位置，将字符串分为两段
func Partition(s string, sep string) (string, string) {
	parts := strings.SplitN(s, sep, 2)
	if len(parts) == 1 {
		return parts[0], ""
	}
	return parts[0], parts[1]
}

// Decapitalize 首字母转小写（暂不考虑去除空白字符）
func Decapitalize(s string) string {
	return strings.ToLower(s[:1]) + s[1:]
}
