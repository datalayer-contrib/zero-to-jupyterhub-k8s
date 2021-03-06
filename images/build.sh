#!/usr/bin/env bash

# Licensed to Datalayer (http://datalayer.io) under one or more
# contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. Datalayer licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

CUR_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

git checkout datalayer

function build() {
  folder=$1
  project=$2
  version=$3
  cd $CUR_DIR/$folder
  docker build \
    -t datalayer/$project:$version \
    .
#  docker push datalayer/$project:$version
}

build 'hub' 'jupyterhub' '0.0.1'
build 'image-awaiter' 'jupyterhub-image-awaiter' '0.0.1'
build 'network-tools' 'jupyterhub-network-tools' '0.0.1'
build 'pod-culler' 'jupyterhub-pod-culler' '0.0.1'
