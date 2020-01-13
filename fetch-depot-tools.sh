set -e
export DEPOT_TOOLS_PATH="${PWD}/depot_tools"

echo "Getting depot tools"
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git --depth=1 $DEPOT_TOOLS_PATH
