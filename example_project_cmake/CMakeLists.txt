cmake_minimum_required(VERSION 3.16.0 FATAL_ERROR)

project(example_project_cmake)

if(NOT CMAKE_BUILD_TYPE)
  message(FATAL_ERROR "No build type specified, ie. use -DCMAKE_BUILD_TYPE=<config> typical values are Debug, Release, RelWithDebInfo and MinSizeRel")
endif()

if (MSVC)
  include(CMakeLists.msvc.zero.config.cmake)
endif()

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" CACHE PATH "installation path" FORCE)
endif() 

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(CopperSpice REQUIRED)

if (${COPPERSPICE_VERSION} VERSION_LESS "1.8.0")
   message(FATAL_ERROR "** Error: Minimum required version for CopperSpice is 1.8.0")
endif()

include(CMakeLists.warnings.cmake)

# Setting the rpath to '$ORIGIN' ensures our application looks for the
# CopperSpice libraries and plugins in its own directory first.
set(CMAKE_INSTALL_RPATH "\$ORIGIN")

add_subdirectory(src)

if(${CMAKE_SIZEOF_VOID_P} EQUAL 4)
   set(TARGETBITS 32)
else()
   set(TARGETBITS 64)
endif()

message("")
message("${PROJECT_NAME} configured to run on:  ${CMAKE_SYSTEM_NAME} ${TARGETBITS} bit, ${CMAKE_BUILD_TYPE} Mode")
message("${PROJECT_NAME} will be built in:      ${CMAKE_BINARY_DIR}")
message("${PROJECT_NAME} will be installed in:  ${CMAKE_INSTALL_PREFIX}")
message("\n")
