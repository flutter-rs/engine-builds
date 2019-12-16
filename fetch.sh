#/bin/bash

echo Environment

export DEPOT_TOOLS_PATH="${PWD}/depot_tools"
export BUILDROOT_PATH="${PWD}/buildroot"
export ENGINE_PATH="${PWD}/engine"

env

echo User:

whoami


echo Add github
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

echo Installing deps
apt-get update
apt-get install -y git wget curl unzip python lsb-release sudo apt-transport-https

echo "Getting depot tools"
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git $DEPOT_TOOLS_PATH
export PATH="$PATH:$DEPOT_TOOLS_PATH"

echo "Fetching engine"
mkdir -p $ENGINE_PATH
echo 'solutions = [{"managed": False,"name": "src/flutter","url": "git@github.com:flutter/engine.git","deps_file": "DEPS", "custom_vars": {"download_android_deps" : False, "download_windows_deps" : False,},},]' > $ENGINE_PATH/.gclient
cd $ENGINE_PATH
gclient sync

echo "Instaling build depts"

./build/install-build-deps-android.sh --no-prompt
./build/install-build-deps.sh --no-prompt
 sudo ./build/install-build-deps-linux-desktop.sh

echo "Getting extra depts"
apt-get update && apt-get install -y google-chrome-stable libx11-dev
apt-get clean