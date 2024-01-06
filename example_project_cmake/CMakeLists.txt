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

find_package(CopperSpice 1.8.2 REQUIRED)

include(CMakeLists.warnings.cmake)

if(BUILD_WITH_ASAN)
    add_compile_options(-fsanitize=address)
    add_link_options(-fsanitize=address)
    message("-- build with ASAN enabled")
endif()

if(BUILD_WITH_UBSAN)
    add_compile_options(-fsanitize=undefined)
    add_link_options(-fsanitize=undefined)
    message("-- build with UBSAN enabled")
endif()

if(BUILD_WITH_ASAN OR BUILD_WITH_UBSAN)
   add_compile_options(-fno-var-tracking-assignments)
   #add_compile_options(-mcmodel=large)
   #add_compile_options(--param=max-vartrack-size=2500000)
   #add_link_options(-mcmodel=large)
   #add_compile_options(-Wl,--image-base -Wl,0x10000000)
endif()

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
