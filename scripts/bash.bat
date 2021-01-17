@echo off

:: make environment variables local because vcvarsall.bat polutes it
SETLOCAL
Path=%PATH%

set PRE_BUILD="C:\Program Files (x86)\Microsoft Visual Studio\2019\Preview\VC\Auxiliary\Build\vcvarsall.bat"
set COM_BUILD="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat"
set PRO_BUILD="C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvarsall.bat"
set ENT_BUILD="C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsall.bat"

set VCVARS=not_found

if exist %PRE_BUILD% (
  set VCVARS=%PRE_BUILD%
) 

if exist %COM_BUILD% (
  set VCVARS=%COM_BUILD%
) 

if exist %PRO_BUILD% (
  set VCVARS=%PRO_BUILD%
) 

if exist %ENT_BUILD% (
  set VCVARS=%ENT_BUILD%
) 

call %VCVARS% x64

:: pushd "C:\project\internal-copperspice"
"C:\Program Files\Git\bin\bash.exe"
