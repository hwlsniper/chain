#!/bin/bash

SOURCE_DIR="$PROJECT_DIR"
TARGET_DIR="$BUILT_PRODUCTS_DIR/$CONTENTS_FOLDER_PATH/Resources"

export CHAIN="${SOURCE_DIR}/../.."
export GOPATH="${CHAIN}/../.."
export PATH="${PATH}:/usr/local/go/bin"

tempBuildPath=`mktemp -d`
trap "rm -rf $tempBuildPath" EXIT

headId=`git rev-parse HEAD`
releaseTag="chain-core-server-1.2.0-ivy"
"${CHAIN}/bin/build-cored-release" $releaseTag $tempBuildPath

cp -f $tempBuildPath/cored "${TARGET_DIR}/"
cp -f $tempBuildPath/corectl "${TARGET_DIR}/"
