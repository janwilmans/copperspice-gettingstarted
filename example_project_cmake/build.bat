set CS_RELEASE_PATH=C:/project/internal-copperspice/package/nuget/copperspice.1.8.2/build/native/release/cmake
set CS_DEBUG_PATH=C:/project/internal-copperspice/package/nuget/copperspice.1.8.2/build/native/debug/cmake

set CMAKE_ARGS=-DCMAKE_INSTALL_PREFIX=install -DMSVC_TOOLSET_VERSION=143 -G Ninja

cmake -DCMAKE_PREFIX_PATH=%CS_DEBUG_PATH% %CMAKE_ARGS% -DCMAKE_BUILD_TYPE=Debug -Bbuild/debug
cmake --build build/debug --target install

::cmake -DCMAKE_PREFIX_PATH=%CS_RELEASE_PATH% %CMAKE_ARGS% -DCMAKE_BUILD_TYPE=RelWithDebInfo -Bbuild/release
::cmake --build build/release --target install
