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

load("//web/internal:metadata.bzl", "metadata")


def _web_test_archive_impl(ctx):
  metadata.create_file(
      ctx=ctx,
      output=ctx.outputs.web_test_metadata,
      web_test_files=[
          metadata.web_test_files(
              ctx=ctx,
              archive_file=ctx.file.archive,
              named_files=ctx.attr.named_files),
      ])

  return struct(
      runfiles=ctx.runfiles(
          collect_data=True, collect_default=True, files=[ctx.file.archive]),
      web_test=struct(metadata=ctx.outputs.web_test_metadata))


web_test_archive = rule(
    implementation=_web_test_archive_impl,
    attrs={
        "archive":
            attr.label(
                allow_single_file=True, cfg="data", mandatory=True),
        "named_files":
            attr.string_dict(mandatory=True)
    },
    outputs={"web_test_metadata": "%{name}.gen.json"},)
"""Specifies an archive file with named files in it.

The archive will be unzipped only if Web Test Launcher wants one the named
files in the archive.

Args:
  archive: label referring to the archive file.
  named_files: a map of names used by Web Test Launcher to path in the archive.
"""
