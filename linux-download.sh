#/bin/bash
export DEPOT_TOOLS_PATH="${PWD}/depot_tools"
export BUILDROOT_PATH="${PWD}/buildroot"
export ENGINE_PATH="${PWD}/engine"

echo Add github
echo -e "StrictHostKeyChecking no\n" >> ~/.ssh/config

echo Installing deps
sudo apt-get update
sudo apt-get install -y git wget curl unzip python lsb-release sudo apt-transport-https

echo "Getting depot tools"
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git $DEPOT_TOOLS_PATH
export PATH="$PATH:$DEPOT_TOOLS_PATH"

echo "Fetching engine"
mkdir -p $ENGINE_PATH
echo 'solutions = [{"managed": False,"name": "src/flutter","url": "https://github.com/flutter/engine.git","deps_file": "DEPS", "custom_vars": {},},]' > $ENGINE_PATH/.gclient
cd $ENGINE_PATH
gclient sync

echo "Instaling build depts"
cd $ENGINE_PATH/src
sudo ./build/install-build-deps-android.sh --no-prompt
sudo ./build/install-build-deps.sh --no-prompt

echo "Getting extra depts"
sudo apt-get update && sudo apt-get install -y google-chrome-stable libx11-dev
sudo apt-get clean