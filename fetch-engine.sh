set -e
export ENGINE_PATH="${PWD}/engine"
export PATH="${PWD}/depot_tools:${PATH}"

echo "Fetching engine"
mkdir -p $ENGINE_PATH

cp gclientconfig $ENGINE_PATH/.gclient

cd $ENGINE_PATH
gclient sync -r $1
