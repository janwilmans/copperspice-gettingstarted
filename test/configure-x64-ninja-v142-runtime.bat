:: the ninja generator will use the default target platform of the 'Visual Studio Tools Command Prompt' it runs in.

:: make environment local because vcvarsall.bat polutes it
setlocal
set Path=%PATH%

set SRC=%cd%
set COM_BUILD="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat"
set PRO_BUILD="C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvarsall.bat"
set ENT_BUILD="C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsall.bat"

if exist %COM_BUILD% (
  call %COM_BUILD% x64
) 

if exist %PRO_BUILD% (
  call %PRO_BUILD% x64
) 

if exist %ENT_BUILD% (
  call %ENT_BUILD% x64
) 

:: I give two examples here, one for a release configuration and one with a debug configuration build type
:: in practive, you will want to use only one of the two at one time.
:: NOTICE: msvc binaries build in a debug configuration are ABI INcompatible with the release configuration
::         so it is important to have everything built with the same configuration build type.


#set CMAKE_PREFIX_PATH=D:\project2\copperspice-msvc\out\install\x64-Debug\cmake\CopperSpice
set CMAKE_PREFIX_PATH=D:\project2\copperspice-msvc\x64\debug\install\cmake\CopperSpice

rd /s /q x64
mkdir x64
mkdir x64\release
pushd x64\release
cmake -DCMAKE_INSTALL_PREFIX=install -DMSVC_TOOLSET_VERSION=142 -DCMAKE_BUILD_TYPE=RelWithDebInfo -G Ninja %SRC%
popd

#set CMAKE_PREFIX_PATH=D:\project2\copperspice-msvc\out\install\x64-Debug\cmake\CopperSpice
set CMAKE_PREFIX_PATH=D:\project2\copperspice-msvc\x64\debug\install\cmake\CopperSpice


mkdir x64\debug
pushd x64\debug
cmake -DCMAKE_INSTALL_PREFIX=install -DMSVC_TOOLSET_VERSION=142 -DCMAKE_BUILD_TYPE=Debug -G Ninja %SRC%
popd

@echo off
echo Compile using: (order of arguments is important!)
echo cmake --build x64\release
echo   or 
echo cmake --build x64\debug

pause
