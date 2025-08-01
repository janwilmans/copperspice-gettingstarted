cmake_minimum_required(VERSION 3.31 FATAL_ERROR)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_EXTENSIONS OFF)

project(
  example_project_cmake
  VERSION 1.0
  DESCRIPTION "This ends up in package description"
  HOMEPAGE_URL "https://the origin of the project"
  LANGUAGES CXX C
)

# directory where the 'install' target will write its output
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" CACHE PATH "installation path" FORCE)
endif()

if (MSVC)
  include(cmake/CMakeLists.msvc.zero.config.cmake)

  # use all available cores to build, this speed up the build a lot
  add_compile_options(/MP)

  # link statically against the MSVC runtime, this costs ~500k per binary, but prevents
  # having to install a MSVC runtime library on the target
  set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
endif()

enable_testing()

find_package(CopperSpice REQUIRED)

include(cmake/CMakeLists.warnings.cmake)

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

target_compile_options(define_project_compile_options INTERFACE /utf-8)

add_library(project::warnings_options ALIAS define_project_warning_options)
add_library(project::warning_suppressions ALIAS define_project_warning_suppressions)
add_library(project::project_compile_options ALIAS define_project_compile_options)

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
