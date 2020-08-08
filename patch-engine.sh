set -e
curl -O https://raw.githubusercontent.com/graphitemaster/incbin/main/incbin.h
cp main.gn engine/src/flutter/BUILD.gn
cp incbin.h engine/src/flutter/shell/platform/embedder/
echo "
#include \"incbin.h\"
INCBIN(Icudtl, \"${PWD}/engine/src/third_party/icu/flutter/icudtl.dat\");
" >> engine/src/flutter/shell/platform/embedder/embedder.cc
cp switches.patch engine/src/flutter/shell/common/
cd engine/src/flutter/shell/common && patch -i switches.patch
