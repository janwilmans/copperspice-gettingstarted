# How to get started with CopperSpice on Visual Studio

A collection of easy to use copperspice examples, specifically:
* using visual studio 2019
* using the copperspice 1.6.2 nuget package, see https://www.nuget.org/packages/Copperspice/

This 'getting-started' is currently not concerned with platform-independence, the NuGet solution targets windows only, however, it you want to use it on other platforms, its a matter of writing a CMake file to make it work.

To get started with Copperspice, there is no need to understand all of this at once.
The example offered here focusses on getting you up and running in 5 minutes, on windows, using visual studio 2019 (community edition works, any other version will work fine as well.)

# Usage

Use these steps to start:

* install Visual Studio from here https://visualstudio.microsoft.com/vs/
  * during installation choose 'Desktop development with C++'
  
* `git clone https://github.com/janwilmans/copperspice-gettingstarted.git` 
* open the \copperspice-gettingstarted\example_project_vs2019\HelloHerbs\HelloHerbs.sln 
* press F5 to build and run it. 

## Visual Studio 2019 / HelloHerbs
The simple but odd hybrid console / GUI application, however, none of weird debug/release tricks.
This is an example you want to use if you want a commandline application.

## Visual Studio 2019 / CompiledUIControl
Basically the same example, but with an .ui (XML) file that is automatically compiled into a header file.
This is the example you want to use for a normal window GUI application.

## Visual Studio 2017 / HelloHerbs
A simple but odd hybrid console / GUI application.
- uses only code to describe the UI (no XML and no designer tools required)
- always links to the release libraries even in debug mode, see cs_assert.h for the workaround for assertions.
  This is for illustrative purposes only, just to show it can be done. *not recommended for production*

## Visual Studio 2017 / CompiledUIControl
Basically the same example, but with an .ui (XML) file that is automatically compiled into a header file.

## Minimal requirements

CopperSpice 1.5.x based projects require a compliant C++14 compiler, which in case of visual studio means 2017 15.8.1 or greater.

```
#if _MSC_VER < 1914
#    error "CopperSpice requires Visual Studio 2017 Version 15.8 or greater"
#endif
```

CopperSpice 1.6.x and beyond require C++17, however, since Visual Studio 2017 15.8 already completely supported it, the minimal version has not changed.

## Special note for VS2017 users
There are two bugs you may encounter in the latest vs2017 version: (they are fixed in vs2019 16.3.8)

* projects that have never been opened before will fail the first compilation for a project that has NuGet references. This is because it does not automatically retreive the NuGet packages before building.
* projects that have custom compilation rules coming from a Nuget package don't show the references correctly in the solution explorer.

As a side effect, IntelliSense also does not work correctly.

To work around this:
1) open the .sln, if visual studio asks you if you want to upgrade the project, choose `yes`.
2) save all files (File->Save all)
3) close visual studio and reopen the same solution
4) all references show ok now, the project should build, IntelliSense should work and you will not have to do this again.


