# Copyright 2016 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################
#
package(
    default_testonly = 1,
    default_visibility = ["//browsers:__subpackages__"],
)

load("//web:web.bzl", "web_test_archive")

licenses(["notice"])  # BSD

exports_files(["LICENSE"])

config_setting(
    name = "mac",
    values = {"cpu": "darwin"},
)

config_setting(
    name = "linux",
    values = {"cpu": "k8"},
)

web_test_archive(
    name = "phantomjs",
    archive = "@org_phantomjs//file",
    named_files = select({
        ":linux": {
            "PHANTOMJS": "phantomjs-2.1.1-linux-x86_64/bin/phantomjs",
        },
        ":mac": {
            "PHANTOMJS": "phantomjs-2.1.1-macosx/bin/phantomjs",
        },
    }),
)
