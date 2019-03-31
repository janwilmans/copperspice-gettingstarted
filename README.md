# copperspice-gettingstarted
A collection of easy to use copperspice examples.

steps to start using:
```
git clone https://github.com/janwilmans/copperspice-gettingstarted.git
```

Open the /copperspice-gettingstarted/visual studio 2017/HelloHerbs/HelloHerbs.sln 
press F5 to build and run it. Thats it... you're running a hello Herbs application.


# Example projects
## visual studio 2017 / HelloHerbs
A simple but odd hybrid console / GUI application.
- uses only code to describe the UI (no XML and no designer tools required)

## visual studio 2017 / CompiledUIControl
Basically the same example, but with an .ui (XML) file that is automatically compiled into a header file.

[![Build Status](https://dev.azure.com/copperspice/copperspice-msvc/_apis/build/status/janwilmans.copperspice-gettingstarted?branchName=master)](https://dev.azure.com/copperspice/copperspice-msvc/_build/latest?definitionId=2&branchName=master)

Note that copperspice requires a compliant C++14 compiler, which in case of visual studio means 2017 15.8 or greater.

```
#if _MSC_VER < 1914
#    error "CopperSpice requires Visual Studio 2017 Version 15.8 or greater"
#endif
```

# nuget packaging notes

The Copperspice.1.5.2.1.nuspec files was created using <https://github.com/NuGetPackageExplorer/NuGetPackageExplorer>

inital structure:
```
|   Copperspice.1.5.2.1.nuspec
|   pack.bat
|
\---build
    \---native
        |   copperspice.targets
        |
        \---copperspice
                placeholder_readme.txt
```

ready to be packaged structure:

```
|   Copperspice.1.5.2.1.nuspec
|   pack.bat
|
\---build
    \---native
        |   copperspice.targets
        |
        \---copperspice
            +---bin
            +---cmake
            +---include
            \---lib
```

