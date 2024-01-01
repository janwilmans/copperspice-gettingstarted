:: the ninja generator will use the default target platform of the 'Visual Studio Tools Command Prompt' it runs in.

:: make environment local because vcvarsall.bat polutes it
setlocal
set Path=%PATH%

set SRC=%cd%
set COM_BUILD="C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat"
set PRO_BUILD="C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvarsall.bat"
set ENT_BUILD="C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsall.bat"

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
:: in practice, you will want to use only one of the two at one time.
:: NOTICE: msvc binaries build in a debug configuration are ABI INcompatible with the release configuration
::         so it is important to have everything built with the same configuration build type.

set CS_PATH=C:\CS18Debug\cmake\CopperSpice

mkdir x64\debug
pushd x64\debug
cmake -DCMAKE_INSTALL_PREFIX=install -DCMAKE_BUILD_TYPE=Debug -DCMAKE_IGNORE_PATH="C:/MinGW/bin" -DCMAKE_PREFIX_PATH=%CS_PATH% -G Ninja %SRC%
popd

@echo off
echo Compile using: (order of arguments is important!)
echo cmake --build x64\release
echo   or 
echo cmake --build x64\debug

pause
