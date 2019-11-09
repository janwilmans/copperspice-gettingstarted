# copperspice-gettingstarted
A collection of easy to use copperspice examples, specifically:
* using visual studio 2019
* using the copperspice nuget package

# Usage

Use these steps to start:

* `git clone https://github.com/janwilmans/copperspice-gettingstarted.git` 
* open the /copperspice-gettingstarted/visual studio 2019/HelloHerbs/HelloHerbs.sln 
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
- always links to the release libraries even in debug mode, see cs_assert.h for the workaround for assertions.

## visual studio 2017 / CompiledUIControl
Basically the same example, but with an .ui (XML) file that is automatically compiled into a header file.

## visual studio 2019 / HelloHerbs
The simple but odd hybrid console / GUI application, however, none of weird debug/release tricks.
This is an example you want to use if you want a commandline application.

## visual studio 2019 / CompiledUIControl
Basically the same example, but with an .ui (XML) file that is automatically compiled into a header file.
This is the example you want to use for a normal window GUI application.

Note that copperspice requires a compliant C++14 compiler, which in case of visual studio means 2017 15.8 or greater.

```
#if _MSC_VER < 1914
#    error "CopperSpice requires Visual Studio 2017 Version 15.8 or greater"
#endif
```

