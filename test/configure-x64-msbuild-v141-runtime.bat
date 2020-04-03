:: at least "Visual Studio 2017 Version 15.8" is required to build

:: NOTICE: msvc binaries build in a debug configuration are ABI INcompatible with the release configuration
::         so it is important to have everything built with the same configuration build type.

set CMAKE_PREFIX_PATH=D:\project2\copperspice-msvc\out\install\x64-Release\cmake\CopperSpice

set SRC=%cd%
mkdir x64
pushd x64
:: remember -DCMAKE_BUILD_TYPE=RelWithDebInfo has no effect on "Visual Studio" multi-config generatators
cmake -G "Visual Studio 15 2017" -A x64 -T v141,host=x64 %SRC%
popd

@echo off
echo Compile using: (order of arguments is important!)
echo cmake --build x64 --config Debug
echo   or 
echo cmake --build x64 --config RelWithDebInfo

pause

