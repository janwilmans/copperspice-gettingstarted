cmake -DMSVC_TOOLSET_VERSION=143 -G Ninja -DCMAKE_BUILD_TYPE=Debug -Bbuild/debug
cmake --build build/debug --target install

cmake -DMSVC_TOOLSET_VERSION=143 -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -Bbuild/release
cmake --build build/release --target install
