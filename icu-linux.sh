#/bin/bash
DEPOT_TOOLS_PATH="${PWD}/depot_tools"
ENGINE_PATH="${PWD}/engine"
PATH="$PATH:$DEPOT_TOOLS_PATH"
OUT_PATH="${PWD}/engine_out/icudtl"
TARGET=$0

echo "Generating icudtl"
cp $ENGINE_PATH/src/third_party/icu/flutter/icudtl.dat $OUT_PATH/icudtl.dat
$ENGINE_PATH/src/flutter/sky/tools/objcopy.py --objcopy objcopy --input $OUT_PATH/icudtl.dat --output $OUT_PATH/icudtl-x64.o --arch x64
$ENGINE_PATH/src/flutter/sky/tools/objcopy.py --objcopy objcopy --input $OUT_PATH/icudtl.dat --output $OUT_PATH/icudtl-x86.o --arch x86
$ENGINE_PATH/src/flutter/sky/tools/objcopy.py --objcopy objcopy --input $OUT_PATH/icudtl.dat --output $OUT_PATH/icudtl-arm64.o --arch arm64
$ENGINE_PATH/src/flutter/sky/tools/objcopy.py --objcopy objcopy --input $OUT_PATH/icudtl.dat --output $OUT_PATH/icudtl-arm.o --arc arm
#ar rcs $OUT_PATH/libicudtl.a $OUT_PATH/icudtl.o