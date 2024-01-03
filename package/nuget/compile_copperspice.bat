cmake -DMSVC_TOOLSET_VERSION=143 -DCMAKE_BUILD_TYPE=Debug -Bcs_build\debug -G Ninja ../..
cmake --build cs_build\debug --target install

cmake -DMSVC_TOOLSET_VERSION=143 -DCMAKE_BUILD_TYPE=RelWithDebInfo -Bcs_build\release -G Ninja ../..
cmake --build cs_build\release --target install
