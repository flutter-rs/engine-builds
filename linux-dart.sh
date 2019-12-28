#/bin/bash
DEPOT_TOOLS_PATH="${PWD}/depot_tools"
ENGINE_PATH="${PWD}/engine"
export PATH="$PATH:$DEPOT_TOOLS_PATH"
OUT_PATH="${PWD}/engine_out"
TARGET=$1

export ANDROID_HOME=$ENGINE_PATH/src/third_party/android_tools/sdk

cd $ENGINE_PATH/src/flutter/tools/android_lint
$ENGINE_PATH/src/third_party/dart/tools/sdks/dart-sdk/bin/pub get
$ENGINE_PATH/src/third_party/dart/tools/sdks/dart-sdk/bin/dart bin/main.dart