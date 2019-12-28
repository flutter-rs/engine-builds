#/bin/bash
DEPOT_TOOLS_PATH="${PWD}/depot_tools"
ENGINE_PATH="${PWD}/engine"
export PATH="$PATH:$DEPOT_TOOLS_PATH"
OUT_PATH="${PWD}/engine_out"
TARGET=$0

echo "Building $TARGET"
cd "${ENGINE_PATH}/src"
ninja -C "out/${TARGET}"

echo "Copying output"
mkdir -p "${OUT_PATH}/${TARGET}"

export SRC_OUT_PATH="${ENGINE_PATH}/src/out/${TARGET}"

echo Copying other outputs
cp $SRC_OUT_PATH/libflutter_engine.so $OUT_PATH/libflutter_engine.so
cp $SRC_OUT_PATH/flutter_embedder.h $OUT_PATH/flutter_embedder.h
cp $SRC_OUT_PATH/dart $OUT_PATH/dart
cp -r $SRC_OUT_PATH/flutter_patched_sdk $OUT_PATH/flutter_patched_sdk
cp $SRC_OUT_PATH/frontend_server.dart.snapshot $OUT_PATH/frontend_server.dart.snapshot
cp $SRC_OUT_PATH/gen_snapshot $OUT_PATH/gen_snapshot