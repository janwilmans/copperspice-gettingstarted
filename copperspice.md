CopperSpice is a set of individual libraries which can be used to develop cross platform software applications in C++. It is a totally open source project released under the LGPL V2.1 license and was initially derived from the Qt framework. Over the last several years CopperSpice has completely diverged, with a goal of providing a first class GUI library to unite the C++ community.

Our motivation for developing CopperSpice was to change the fundamental design and turn the existing framework into a set of libraries for C++ developers. We are accomplishing this by leveraging modern C++ functionality, new technology, and modern tooling. CopperSpice currently requires C++17 or newer.

You can use CopperSpice with any existing tool chain such as GCC, clang, or MSVC. A C++ program using the CopperSpice libraries can be developed using any editor such as VI, emacs, or Diamond and built using CMake from a shell command line. For an integrated environment Visual Studio or QtCreator can be used for development, building, testing, and deployment.

# Libraries
CopperSpice consists of the following libraries which can be linked into any existing C++ application.


## CsCore
Date/Time, Containers (QVector, QList, QMap, QHash, QStack, etc), File System, JSON, Strings (utf8, utf16)

## CsGui
File Dialogs, Menus, Widgets (QCheckbox, QPushbutton, QLineEdit, etc), Printing

## CsMultimedia
Audio, Video

## CsNetwork
TCP, HTTP, FTP, IPv6, DNS lookups, SSL, URL support

## CsOpenGL
Rendering Context, Shader

## CsScript
JavaScript engine which can be embeded in your application

## CsSql
SQLite, PostGRES, MySQL, etc

## CsSvg
Renderer, Widget

## CsWebKit
Web View, Web Page

## CsXml
DOM, Reader

## CsXmlPatterns
Schema, Xml Query

# Fully Embracing C++ Centric Development

## Simplified build process

The Meta-Object Compiler (moc) is a wonderfull piece of work in a C++98 context, however with the advent of C++11/14 it has served its purpose and for developers that are using more modern compilers it is limiting and making the build process more complicated then it needs to be. The Meta-Object Compiler is no longer required for generating reflection meta data in CopperSpice, so it was removed.

This also means a template class can now inherit from QObject with no restrictions on data types

## Type and thread safe Signals/Slots

We now have thread aware Signal/Slot delivery, also complex data types can be used as Slot arguments, for example the following is valid in CopperSpice: QMap<QString, int>. 

# More generic containers 

QVector, QList, QStringList, QLinkedList, QSet, QStack, QQueue, QMap, QHash, QMultiMap, QMultiHash, all these containers are now wrapping STL containers and a have an STL compatible interface, this means you can now use CopperSpice containters with STL algorithms out of the box and things like a range-based for just works. For backwards compatiblity the containers also support the Qt API.

Several containers where rewritten to remove suprising behaviour, for example QMap could contain multiple values with the same key, something normally only a multi-map can do. To solved this a couple of new containers where added, namely: QFlatMap, QMultiHash and QMultiMap. Futhermore reverse iterators where added and copy on write semantics removed.

# (partial) Backwards compatibility 

For backwards compatibility CopperSpice includes a majority of the Qt5 classes.

# High DPI support

CsPaint wraps the (very complicated) vulcan API on all platforms. CsPaint enables rendering of very crisp fonts on _any_ resolution without knowing in advance what resolution will be used. Also native 3D hardware acceleration can be harnessed to deliver the best possible UI performance. Unicode 11 and Harfbuzz 2 are used for text shaping.

# Update network support

 CsNetwork now supports OpenSSL 1.0.x, TLS and SPDY.

# Other improvements

- support for SHA-2 and SHA-3
- atomic support (QAtomicInt, QAtomicPointer) wrapping the C++ standard library functionality
- QLocale refactored to use UTF-8 strings for better Unicode text support
- Codecs now use UTF-8 strings
- Improved platform specific support for 

Redesigned plugin system
Integration of CsSignal

Improved thread aware Signal/Slot delivery
Increased efficiency while maintaining the full Signal/Slot API
Deadlocks in Signal/Slot processing have been eliminated
Integration of CsString
Improved storage to properly represent Unicode strings
Added new QString8 (UTF-8) and QString16 (UTF-16) classes
QString is synonymous with QString8
Moved various formatting methods to the new QStringParser class
Developed a new QRegularExpression class which uses iterators internally to handle UTF-8 and UTF-16
Created a new QStringView class which works correctly with the new QString classes
Remove string surrogate checking since it is not required with UTF-8 / UTF-16 encoding


# Removed features

- dropped support of obsolete platforms


Building
CopperSpice libraries are built using modern CMake syntax
C++ applications using CopperSpice can be built with CMake or any other build system of your choice
BSD Libraries
CsSignal is a library for thread aware Signal/Slot delivery. It is used by CopperSpice for efficiency while maintaining the full API.
CsString is a Unicode aware string library. It is used by CopperSpice to support UTF-8 (QString8) and UTF-16. (QString16)
libGuarded encapsulates a mutex with the corresponding data. There are several different classes available to support multi-threading allowing developers to choose the most appropriate solution. It is used by the CsSignal library.
For more information refer to our presentations from CppNow, CppCon, and our YouTube videos. Presentations

Converting to CopperSpice
The process of converting to CopperSpice is simple and quick. Simply convert your Qt application header files one time using our PepperMill utility. The Makefiles from our demo program KitchenSink, DoxyPress,or and the Diamond Editor applications can be used as a guide to create your project files.

Getting Started
The CS Overview documentation includes how to build CopperSpice from source, setting up a project using CopperSpice, and how to migrate from Qt to CopperSpice.  CS Overview Documentation

Contacting CopperSpice
Ask questions or request a feature on our GitHub repository  CopperSpice  DoxyPress
Join a discussion on our forum  Forum
Email the co-founders: info [at] copperspice.com
