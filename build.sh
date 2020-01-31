set -e
DEPOT_TOOLS_PATH="${PWD}/depot_tools"
ENGINE_PATH="${PWD}/engine"
export PATH="$DEPOT_TOOLS_PATH:/usr/local/opt/binutils/bin:$PATH"
OUT_PATH="${PWD}/engine_out"
TARGET=$1

export ANDROID_HOME=$ENGINE_PATH/src/third_party/android_tools/sdk

echo "Building $TARGET"
cd "${ENGINE_PATH}/src"
ninja -C "out/${TARGET}"

echo "Copying output"
mkdir -p "${OUT_PATH}/gen"

export SRC_OUT_PATH="${ENGINE_PATH}/src/out/${TARGET}"

echo Copying other outputs
cp $SRC_OUT_PATH/libflutter_engine.so $OUT_PATH/libflutter_engine.so ||
cp $SRC_OUT_PATH/libflutter_engine.dylib $OUT_PATH/libflutter_engine.dylib ||
(
  cp $SRC_OUT_PATH/flutter_engine.dll $OUT_PATH/flutter_engine.dll &&
  cp $SRC_OUT_PATH/flutter_engine.dll.lib $OUT_PATH/flutter_engine.lib &&
  cp $SRC_OUT_PATH/flutter_engine.dll.exp $OUT_PATH/flutter_engine.exp &&
  cp $SRC_OUT_PATH/flutter_engine.dll.pdb $OUT_PATH/flutter_engine.pdb
)
cp $SRC_OUT_PATH/flutter_embedder.h $OUT_PATH/flutter_embedder.h
cp $ENGINE_PATH/src/third_party/icu/flutter/icudtl.dat $OUT_PATH/icudtl.dat
cp -r $SRC_OUT_PATH/flutter_patched_sdk $OUT_PATH/flutter_patched_sdk
cp $SRC_OUT_PATH/dart $OUT_PATH/dart || true
cp $SRC_OUT_PATH/gen/frontend_server.dart.snapshot $OUT_PATH/gen/frontend_server.dart.snapshot || true
cp $SRC_OUT_PATH/gen_snapshot $OUT_PATH/gen_snapshot || true
cp $SRC_OUT_PATH/clang_x64/gen_snapshot $OUT_PATH/gen_snapshot_x64 || true
cp $SRC_OUT_PATH/clang_x86/gen_snapshot $OUT_PATH/gen_snapshot_x86 || true
cp $SRC_OUT_PATH/clang_x64/gen_snapshot_host_targeting_host $OUT_PATH/gen_snapshot_host_targeting_host || true
