# How to get started with CopperSpice on Visual Studio

A collection of easy to use copperspice examples, specifically:
* using visual studio 2019
* using the copperspice 1.7.0 nuget package, see https://www.nuget.org/packages/Copperspice/

This 'getting-started' does not focus on platform-independence, the NuGet solution targets windows only, however, there is also a CMake example that works on Windows, Linux and MacOS.

To get started with Copperspice, there is no need to understand all of it at once.
The example offered here focusses on getting you up and running in 5 minutes, on windows, using visual studio 2019. The free community edition works, any other version will work fine as well.

# Usage

Use these steps to start:

* install Visual Studio from here https://visualstudio.microsoft.com/vs/
  * during installation choose 'Desktop development with C++'
  
* `git clone https://github.com/janwilmans/copperspice-gettingstarted.git` 
* open the \copperspice-gettingstarted\example_project_vs2019\HelloHerbs\HelloHerbs.sln 
* press F5 to build and run it.

That's it, you should now have compiled your first Copperspice project. If you experience problems, write me an email or tweet and we'll find a solution!

# Repository content

## Visual Studio 2019 \ example_project_vs2019\HelloHerbs
The simple but odd hybrid console / GUI application, however, none of weird debug/release tricks.
This is an example you want to use if you want a commandline application.

## Visual Studio 2019 \ example_project_vs2019\CompiledUIControl
Basically the same example, but with an .ui (XML) file that is automatically compiled into a header file.
This is the example you want to use for a normal window GUI application.

# older examples, nolonger applicable to copperspice 1.7.x or higher.

## Visual Studio 2017 \ example_project_vs2017\HelloHerbs
A simple but odd hybrid console / GUI application.
- uses only code to describe the UI (no XML and no designer tools required)
- always links to the release libraries even in debug mode, see cs_assert.h for the workaround for assertions.
  This is for illustrative purposes only, just to show it can be done. *not recommended for production*

## Visual Studio 2017 \ example_project_vs2017\CompiledUIControl
Basically the same example, but with an .ui (XML) file that is automatically compiled into a header file.

## Visual Studio 2017 \ example_project_vs2017\CompiledUIControl
Basically the same example, but with an .ui (XML) file that is automatically compiled into a header file.

## More portability, digging deeper with CMake / example_project_cmake

Visual Studio 2019 also has CMake or 'Open Folder' support. This enables you to open different kinds of projects, specifically usefull is the cmake project support. The example_project_cmake directory contains an example CMake project.

Once you have the basic setup working, much more information can be found on Jason Turners C++ Weekly - Ep 208 - The Ultimate CMake / C++ Quick Start video https://www.youtube.com/watch?v=YbgH7yat-Jo

In that video he mentions the C++ Starter project at https://github.com/lefticus/cpp_starter_project. The repo not only contains very nice examples of CMake features, but also .clang-format, .clang-tidy and .cmake-format.yaml examples. I recommened you check these out.


## Minimal requirements

CopperSpice 1.7.x based projects require a compliant C++17 compiler, which in case of visual studio means 2019 16.6.x or greater.
CopperSpice 1.6.x or earlier based projects require a compliant C++14 compiler, which in case of visual studio means 2017 15.8.1 or greater.

```
#if _MSC_VER < 1926
#    error "CopperSpice requires Visual Studio 2019 Version 16.6 or greater"
#endif
```

## Special note for VS2017 users
There are two bugs you may encounter in all vs2017 versions: (they are fixed in vs2019 16.3.8)

* projects that have never been opened before will fail the first compilation for a project that has NuGet references. This is because it does not automatically retreive the NuGet packages before building.
* projects that have custom compilation rules coming from a Nuget package don't show the references correctly in the solution explorer.

As a side effect, IntelliSense also does not work correctly.

To work around this:
1) open the .sln, if visual studio asks you if you want to upgrade the project, choose `yes`.
2) save all files (File->Save all)
3) close visual studio and reopen the same solution
4) all references show ok now, the project should build, IntelliSense should work and you will not have to do this again.


## Related references

* https://prereleases.llvm.org/win-snapshots/ pre-release builds of clang-format and LLVM can be found here 

As of september 29 2020 I tested with the 'August 2020' pre-release:
* https://prereleases.llvm.org/win-snapshots/ClangFormat-6923b0a7.vsix
* https://prereleases.llvm.org/win-snapshots/clang-format-6923b0a7.exe
* https://prereleases.llvm.org/win-snapshots/LLVM-12.0.0-6923b0a7-win64.exe



