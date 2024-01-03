set HERE=%~dp0
set COMMON=-DCS_WARNING_SUPPRESSION_FILE="%HERE%\CMakeLists.warnings.suppressed.cmake" -DCS_WARNING_FILE="%HERE%\CMakeLists.warnings.cmake" -DMSVC_TOOLSET_VERSION=143 -G Ninja

::cmake %COMMON% -DCMAKE_BUILD_TYPE=Debug -Bcs_build\debug ..
::cmake --build cs_build\debug --target install

cmake %COMMON% -DCMAKE_BUILD_TYPE=Release -Bbuild\release .. 
::cmake --build cs_build\release --target install
