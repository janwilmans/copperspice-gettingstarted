cmake_minimum_required(VERSION 3.30.0 FATAL_ERROR)

# 3.30 is the minimal version for NUGET REAMDME _and_ CPACK_NUGET_PACKAGE_REPOSITORY_URL support
# https://gitlab.kitware.com/cmake/cmake/-/merge_requests/9139/
# https://cmake.org/cmake/help/latest/cpack_gen/nuget.html#variable:CPACK_NUGET_%3CcompName%3E_REPOSITORY_URL

project(copperspice)

if (NUGET_DOWNLOAD)
    include(FetchContent)

    Set(NUGET_PACKAGE_PATH ${CMAKE_CURRENT_BINARY_DIR}/download)

    FetchContent_Declare(nuget_commandline
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
    SOURCE_DIR ${NUGET_PACKAGE_PATH}/nuget
    URL https://www.nuget.org/api/v2/package/NuGet.CommandLine/6.8.0
    EXCLUDE_FROM_ALL
    URL_HASH   MD5=5763e742453292215c0128dcd6a4ef7b
    )

    FetchContent_MakeAvailable(nuget_commandline)
endif()

# install both debug and release builds of copperspice side-by-side as c:\cs\release and c:\cs\debug
set(CS_ROOT_DIRECTORY "c:/cs")

# include() doesn't introduction a scope
# this function creates a scope for the PARENT_SCOPE variables set in CopperSpiceConfigVersion
function(include_copperspice_version)
    include(${CS_ROOT_DIRECTORY}/release/cmake/copperspice/CopperSpiceConfigVersion.cmake)
endfunction()

include_copperspice_version()

set(PACKAGE_VERSION   "${COPPERSPICE_VERSION_MAJOR}.${COPPERSPICE_VERSION_MINOR}.${COPPERSPICE_VERSION_PATCH}")
set(PACKAGE_STRING    "copperspice ${COPPERSPICE_VERSION_MAJOR}.${COPPERSPICE_VERSION_MINOR}.${COPPERSPICE_VERSION_PATCH}")
set(PACKAGE_TARNAME   "copperspice")
set(PACKAGE_BUGREPORT "info@copperspice.com")
set(PACKAGE_URL       "https://www.copperspice.com/")

set(CPACK_PACKAGE_VENDOR  "CopperSpice")
set(CPACK_PACKAGE_CONTACT "info@copperspice.com")

set(CPACK_PACKAGE_VERSION_MAJOR ${COPPERSPICE_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${COPPERSPICE_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${COPPERSPICE_VERSION_PATCH})

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Cross platform C++ GUI libraries")
set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY  OFF)
set(CPACK_SOURCE_PACKAGE_FILE_NAME    "${PROJECT_NAME}-${PACKAGE_VERSION}")
set(CPACK_PACKAGE_DESCRIPTION_FILE    "${CMAKE_SOURCE_DIR}/DESCRIPTION.md")

# test the description file, read at most 4000 bytes
file(SIZE ${CPACK_PACKAGE_DESCRIPTION_FILE} description_size)

# Check if the file size is at most 4000 bytes (Required )
if(description_size GREATER 4000)
    message(FATAL_ERROR "The description in '${CPACK_PACKAGE_DESCRIPTION_FILE}' can be at most 4000 characters in size.")
endif()

# Find nuget.exe
find_program(EXISTS_NUGET "${NUGET_PACKAGE_PATH}/nuget/tools/nuget.exe")
if (EXISTS_NUGET)
    message(STATUS "Found nuget.exe at: ${EXISTS_NUGET}")
else()
    find_program(EXISTS_NUGET "nuget.exe")
    if (EXISTS_NUGET)
        message(STATUS "Found nuget.exe at: ${EXISTS_NUGET}")
    else()
        message(FATAL_ERROR "nuget.exe (${EXISTS_NUGET}) was not found in the PATH, it can be downloaded from https://dist.nuget.org/win-x86-commandline/latest/nuget.exe or use -DNUGET_DOWNLOAD=1 to download automatically.")
    endif()
endif()

set(CPACK_GENERATOR "NuGet")
set(CPACK_WARN_ON_ABSOLUTE_INSTALL_DESTINATION TRUE)

# ignore if COMPONENT is mentioned in install(), so we always create one package
set(CPACK_NUGET_COMPONENT_INSTALL OFF)
set(CPACK_NUGET_PACKAGE_COPYRIGHT "Copyright (c) 2012-2025 Barbara Geller and Ansel Sermersheim")
set(CPACK_NUGET_PACKAGE_TAGS "Copperspice Native Portable")
set(CPACK_NUGET_PACKAGE_HOMEPAGE_URL "${PACKAGE_URL}")
set(CPACK_NUGET_PACKAGE_RELEASE_NOTES "These are notes specific for this version")

# the license file name refers to a file/path _inside_ the resulting package
set(CPACK_NUGET_PACKAGE_LICENSE_FILE_NAME "LICENSE.md")
set(CPACK_NUGET_PACKAGE_README "README.md")

set(CPACK_NUGET_PACKAGE_REPOSITORY_URL "https://nuget.org/api/v2/package")
set(CPACK_NUGET_PACKAGE_REPOSITORY_TYPE "nuget")

install(DIRECTORY ${CS_ROOT_DIRECTORY}/release/cmake DESTINATION build/native/release)
install(DIRECTORY ${CS_ROOT_DIRECTORY}/release/include DESTINATION build/native/release)
install(DIRECTORY ${CS_ROOT_DIRECTORY}/release/bin DESTINATION build/native/release)
install(DIRECTORY ${CS_ROOT_DIRECTORY}/release/lib DESTINATION build/native/release)
install(DIRECTORY ${CS_ROOT_DIRECTORY}/debug/cmake DESTINATION build/native/debug)
install(DIRECTORY ${CS_ROOT_DIRECTORY}/debug/include DESTINATION build/native/debug)
install(DIRECTORY ${CS_ROOT_DIRECTORY}/debug/bin DESTINATION build/native/debug)
install(DIRECTORY ${CS_ROOT_DIRECTORY}/debug/lib DESTINATION build/native/debug)
install(DIRECTORY ${CMAKE_SOURCE_DIR}/package_template/ DESTINATION .)

if (NUGET_DOWNLOAD)
    # add nuget.exe location to PATH at install time, the "\$ENV" causes delayed expansion inside the 'install' step
    install(CODE "set(ENV{PATH} \"${CMAKE_CURRENT_BINARY_DIR}/download/nuget/tools/;\$ENV{PATH}\")")
endif()

# this include needs to be after all install() rules
include(CPack)

MESSAGE("CS_ROOT_DIRECTORY: ${CS_ROOT_DIRECTORY}")
MESSAGE("PACKAGE_VERSION: ${PACKAGE_VERSION}")
MESSAGE("Output: ${CMAKE_SOURCE_DIR}/build/copperspice${PACKAGE_VERSION}.nupkg")
