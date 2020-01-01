#/bin/bash
export DEPOT_TOOLS_PATH="${PWD}/depot_tools"

echo "Getting depot tools"
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git --depth=1 $DEPOT_TOOLS_PATH
export PATH="$PATH:$DEPOT_TOOLS_PATH"


export ENGINE_PATH="${PWD}/engine"
echo "Fetching engine"
mkdir -p $ENGINE_PATH
echo 'solutions = [{"managed": False,"name": "src/flutter","url": "https://github.com/flutter/engine.git","deps_file": "DEPS"}]' > $ENGINE_PATH/.gclient
cd $ENGINE_PATH
gclient sync
