# copperspice-gettingstarted
A collection of easy to use copperspice examples.

# Usage

Use these steps to start:

* `git clone https://github.com/janwilmans/copperspice-gettingstarted.git` 
* open the /copperspice-gettingstarted/visual studio 2017/HelloHerbs/HelloHerbs.sln 
* press F5 to build and run it. 

## Note for all latest VS users
There is currently two bugs in both the latest vs2017 and vs2019 version:

* projects that have never been opened before will fail the first compilation for a project that has NuGet references. This is because it does not actually retreive the NuGet packages before building.
* projects that have custom compilation rules coming from a Nuget package don't show the references correctly in the solution explorer.

As a side effect, intellisense also does not work correctly.

To work around this:
1) open the .sln, if visual studio ask you if you want to upgrade the project, choose `yes` if you do not have the vs2017 compiler installed, otherwise, you can choose either `yes` or just cancel the dialog, it works either way.
2) save all files (File->Save all)
3) close visual studio, and reopen the same solution
4) all references show ok now, the project should build and intellisence should work and you will not have to do this again.

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

