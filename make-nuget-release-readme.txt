1) download the debug and release version of the MSVC installation from https://download.copperspice.com/copperspice/binary/cs-2.0/
2) install both side-by-side as c:\cs\release and c:\cs\debug
4) edit copperspice-gettingstarted\package\package_template\build\native\copperspice.targets and
   change the major version if it is a major release (the DLL's have the version number in their name, ie CsCore1.7.lib,
   a find-replace "1.6" -> "1.7" is normally sufficient

The PDB files are not packaged because they are usually not required and will increase the nuget package size from 100Mb to ~1.1Gb
To debug copperspice itself, build it from source code.

5) run copperspice-gettingstarted\package\build_nuget_package.bat to generate 'Copperspice.x.x.x.nupkg'
6) test the nupkg locally by opening 'example_project_2022' and updating to the latest local version.
7) upload to Nuget https://www.nuget.org/packages/manage/upload

Done.
