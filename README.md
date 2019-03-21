# copperspice-gettingstarted
A collection of easy to use copperspice examples

# visual studio 2017 / HelloHerbs

A simple but odd hybrid console / GUI application.


# nuget packaging notes

The Copperspice.1.5.0.nuspec files was created using <https://github.com/NuGetPackageExplorer/NuGetPackageExplorer>

inital structure:
```
|   Copperspice.1.5.0.nuspec
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
|   Copperspice.1.5.0.nuspec
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

