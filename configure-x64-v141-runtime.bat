:: do not change the build target paths (causes stashed.io misses)
:: the ninja generator will use the default target platform of the 'Native Tools Command Prompt' it runs in.

mkdir x64
mkdir x64\release
pushd x64\release
cmake -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
popd

mkdir x64\debug
pushd x64\debug
cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug ..
popd


