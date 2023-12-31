set CMAKE_ARGS=-DCMAKE_INSTALL_PREFIX=install -DMSVC_TOOLSET_VERSION=143 -G Ninja

cmake %CMAKE_ARGS% -DCMAKE_BUILD_TYPE=Debug -Bbuild/debug
cmake --build build/debug --target install

::cmake %CMAKE_ARGS% -DCMAKE_BUILD_TYPE=RelWithDebInfo -Bbuild/release
::cmake --build build/release --target install
