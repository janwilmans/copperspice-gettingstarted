
* choose whether to build against v140 or v141 (both require using vs2019 because of cmake version)
* build using stashed in the same directory \x64\debug or \x64\release (otherwise, no cache)
* collect .pdb files from the build output (they are not installed)
* see nuget\build\native\copperspice\content.txt for files to copy manually


references:
 * https://cmake.org/cmake/help/latest/variable/CMAKE_MSVC_RUNTIME_LIBRARY.html#variable:CMAKE_MSVC_RUNTIME_LIBRARY

