:: do not change the build target paths (causes stashed.io misses)
:: the ninja generator has no options to specifiy targeting the vs2015/v140 runtime, so we use the vs-generator
:: vs2019 community edition is required to build.
 
set SRC=%cd%
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat"

mkdir x64
mkdir x64\release
pushd x64\release
cmake -G "Visual Studio 16 2019" -A x64 -T v140 -DCMAKE_BUILD_TYPE=RelWithDebInfo %SRC%
popd

mkdir x64\debug
pushd x64\debug
cmake -G "Visual Studio 16 2019" -A x64 -T v140 -DCMAKE_BUILD_TYPE=Debug %SRC%
popd

pause

