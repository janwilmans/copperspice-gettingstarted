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

Meta-Object Compiler (moc)
The Meta-Object Compiler is no longer required for generating reflection meta data in CopperSpice
Since moc is no longer required it was completely removed
All functionality originally provided by moc was replaced with compile time templates
CopperSpice automatically generates meta data for processing Signals/Slots and Introspection
A template class can now inherit from QObject with no restrictions on data types
Complex data types can be used as Slot arguments, for example the following is valid in CopperSpice: QMap<QString, int>
Removal of moc simplifies the build process

Benefits of CopperSpice
Extensive use of modern C++ functionality
templates, variadic templates, lambdas
expression SFINAE
threading model
move semantics, override
constexpr, decltype, type traits, tuple
strongly typed enums
Redesigned all container classes
Composition is used to wrap the C++ standard library containers
QVector, QList, QStringList, QLinkedList, QSet, QStack, QQueue
QMap, QHash, QMultiMap, QMultiHash
Supports both the STL and Qt API
Implement QMultiHash and QMultiMap as separate classes from QHash and QMap
Reverse iterators added
Removed copy on write semantics
Added QFlatMap
Ordered map which stores elements in contiguous memory as a sorted vector of pairs
Similar API to QMap

CopperSpice includes a majority of the Qt 5 classes
Improved CsNetwork and support for OpenSSL 1.0.x
Support for TLS and SPDY added
Add support for SHA-2 and SHA-3
Reimplemented atomic support (QAtomicInt, QAtomicPointer) wrapping the C++ standard library functionality
Enhanced CopperSpice to use STL algorithms rather than hand rolled algorithms
Removed support of obsolete platforms
QLocale classes refactored to use UTF-8 string classes
Update codec classes to use UTF-8 string classes
High DPI support
Moved to Unicode 11, added support for Harfbuzz 2 for text shaping
Improved platform specific support
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
