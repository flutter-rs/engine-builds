#/bin/bash

echo Environment

export DEPOT_TOOLS_PATH="${PWD}/depot_tools"
export BUILDROOT_PATH="${PWD}/buildroot"
export ENGINE_PATH="${PWD}/engine"
export PATH="$PATH:$DEPOT_TOOLS_PATH"
export OUT_PATH="${PWD}/engine_out"


env

echo User:

whoami


echo Creating build files
cd $ENGINE_PATH/src
./flutter/tools/gn --runtime-mode release --lto --stripped

echo Building
ninja -C out/host_release

echo Copying output
mkdir $OUT_PATH

export SRC_OUT_PATH="${ENGINE_PATH}/src/out/host_release"

cp $SRC_OUT_PATH/libflutter_engine.so $OUT_PATH/libflutter_engine.so
cp $SRC_OUT_PATH/icudtl.dat $OUT_PATH/icudtl.dat
cp $SRC_OUT_PATH/flutter_embedder.h $OUT_PATH/flutter_embedder.h
cp $SRC_OUT_PATH/dart $OUT_PATH/dart
cp -r $SRC_OUT_PATH/flutter_patched_sdk $OUT_PATH/flutter_patched_sdk
cp $SRC_OUT_PATH/frontend_server.dart.snapshot $OUT_PATH/frontend_server.dart.snapshot
cp $SRC_OUT_PATH/gen_snapshot $OUT_PATH/gen_snapshot
