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
package(default_testonly = True)

load("//web:web.bzl", "browser")

licenses(["notice"])  # Apache 2.0

config_setting(
    name = "mac",
    values = {"cpu": "darwin"},
    visibility = ["//:__subpackages__"],
)

config_setting(
    name = "linux",
    values = {"cpu": "k8"},
    visibility = ["//:__subpackages__"],
)

browser(
    name = "firefox-external",
    metadata = "firefox-external.json",
    required_tags = ["requires-network"],
    visibility = ["//visibility:public"],
)

browser(
    name = "chrome-external",
    metadata = "chrome-external.json",
    required_tags = ["requires-network"],
    visibility = ["//visibility:public"],
)

browser(
    name = "firefox-native",
    environment = select({
        ":linux": None,
        ":mac": {"DISABLE_X_DISPLAY": "1"},
    }),
    metadata = "firefox-native.json",
    # if not tagged local, then bazel does not exit cleanly
    required_tags = ["local"],
    visibility = ["//visibility:public"],
    deps = [
        "//third_party/firefox",
        "//third_party/geckodriver",
    ],
)

browser(
    name = "chrome-native",
    environment = select({
        ":linux": None,
        ":mac": {"DISABLE_X_DISPLAY": "1"},
    }),
    metadata = "chrome-native.json",
    visibility = ["//visibility:public"],
    deps = [
        "//third_party/chrome",
        "//third_party/chromedriver",
    ],
)

browser(
    name = "phantomjs",
    environment = {"DISABLE_X_DISPLAY": "1"},
    metadata = "phantomjs.json",
    visibility = ["//visibility:public"],
    deps = [
        "//third_party/phantomjs",
        "//third_party/selenium:SELENIUM_SERVER",
    ],
)

browser(
    name = "disabled",
    disabled = "disabled pseudo-browser",
    metadata = "disabled.json",
    visibility = ["//visibility:public"],
)
