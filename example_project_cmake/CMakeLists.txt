cmake_minimum_required(VERSION 3.16.0 FATAL_ERROR)

project(example_project_cmake)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
  message("No build type specified, defaulting to Debug (no optimizations, include debug symbols), use -DCMAKE_BUILD_TYPE=Release to build in release configuration)")
endif()

if (MSVC)
  include(CMakeLists.msvc.zero.config.cmake)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(CopperSpice REQUIRED)

if (${COPPERSPICE_VERSION} VERSION_LESS "1.8.0")
   message(FATAL_ERROR "** Error: Minimum required version for CopperSpice is 1.8.0")
endif()

if(MSVC)
  # replace /Zx with /Z7 for tooling compatibility (Incredibuild and stashed.io)
  string(REGEX REPLACE "/Z[iI7]" "/Z7" CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")
  string(REGEX REPLACE "/Z[iI7]" "/Z7" CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")

  string (REGEX REPLACE "/W3" "/W4" CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}"  )
  string (REGEX REPLACE "/W3" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  string (REGEX REPLACE ".INCREMENTAL[:NO]*" "/INCREMENTAL:NO" CMAKE_SHARED_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS_DEBUG}")
else()
  # Linux, Windows (MinGW)
  set(CMAKE_EXE_LINKER_FLAGS    "${CMAKE_EXE_LINKER_FLAGS}    -Wl,--no-undefined")
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--no-undefined")
  set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} -Wl,--no-undefined")
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
