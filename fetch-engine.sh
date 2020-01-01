#!/bin/sh
export ENGINE_PATH="${PWD}/engine"
echo "Fetching engine"
mkdir -p $ENGINE_PATH
echo 'solutions = [{"managed": False,"name": "src/flutter","url": "https://github.com/flutter/engine.git","deps_file": "DEPS", "custom_vars": { "download_android_deps": True, },},]' > $ENGINE_PATH/.gclient
cd $ENGINE_PATH
gclient sync