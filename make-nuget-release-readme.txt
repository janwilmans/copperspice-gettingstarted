1) download the debug and release version of the MSVC installation from https://download.copperspice.com/copperspice/binary/cs-2.0/
2) install both side-by-side as c:\cs\release and c:\cs\debug
3) go to copperspice-gettingstarted\nuget\copperspice.x.x.x\Copperspice.nuspec, and edit it to match the release version

Normally, only the 'version' and 'description' tags have to be updated

4) edit copperspice-gettingstarted\nuget\copperspice.x.x.x\build\native\copperspice.targets and change the major version if it is a major release (the DLL's have the version number in their name, ie CsCore1.7.lib)

A find-replace "1.6" -> "1.7" is normally sufficient

6) copy files in pre-defined locations, the structure is mandatory: \build\native\copperspice

copperspice-msvc\x64\release\install\cmake\CopperSpice -> copperspice-gettingstarted\nuget\copperspice.1.7.0\build\native\copperspice\cmake\CopperSpice
copperspice-msvc\x64\release\install\cmake\CopperSpice -> copperspice-gettingstarted\nuget\copperspice.1.7.0\build\native\copperspice\cmake\CopperSpice
copperspice-msvc\x64\release\install\include           -> copperspice-gettingstarted\nuget\copperspice.1.7.0\build\native\copperspice\include
copperspice-msvc\x64\release\install\bin               -> copperspice-gettingstarted\nuget\copperspice.1.7.0\build\native\copperspice\release\bin
copperspice-msvc\x64\release\install\lib               -> copperspice-gettingstarted\nuget\copperspice.1.7.0\build\native\copperspice\release\lib
copperspice-msvc\x64\debug\install\bin                 -> copperspice-gettingstarted\nuget\copperspice.1.7.0\build\native\copperspice\debug\bin
copperspice-msvc\x64\debug\install\lib                 -> copperspice-gettingstarted\nuget\copperspice.1.7.0\build\native\copperspice\debug\lib

The PDB files are not packaged because they are usually not required and will increase the nuget package size from 100Mb to ~1.1Gb
To debug copperspice itself, build it from source code.

7) Edit CopperSpiceBinaryTargets.cmake and CopperSpiceLibraryTargets.cmake to take into account that both debug and release binaries are destributed in the same Nuget package.

8) edit copperspice-gettingstarted\nuget\copperspice\Copperspice.nuspec and update the 'version', 'description' and 'summary' fields

9) run copperspice-gettingstarted\nuget\copperspice\create_nuget_package.bat to generate 'Copperspice.x.x.x.nupkg'

10) test the nupkg locally by opening both copperspice-gettingstarted projects are updating to the latest local version.

11) upload to Nuget https://www.nuget.org/packages/manage/upload

in the upload form, specify the documenation link: https://raw.githubusercontent.com/copperspice/copperspice/master/README.md

Done.
