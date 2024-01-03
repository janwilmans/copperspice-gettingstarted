execute_process(
    COMMAND cmd /C "${CMAKE_CURRENT_LIST_DIR}/post_cpack.py" ${NUGET_EXECUTABLE} ${CPACK_TEMPORARY_INSTALL_DIRECTORY}/CPack.NuGet.nuspec ${CPACK_OUTPUT_FILE_PATH} ${CPACK_TEMPORARY_DIRECTORY}
    RESULT_VARIABLE POST_CPACK_RESULT
    OUTPUT_VARIABLE POST_CPACK_OUTPUT
    ERROR_VARIABLE POST_CPACK_ERROR
    WORKING_DIRECTORY ${CPACK_OUTPUT_FILE_PREFIX}
)

if (POST_CPACK_RESULT)
    message("Result: ${POST_CPACK_RESULT}")
endif()

if (POST_CPACK_OUTPUT)
    message("Output: ${POST_CPACK_OUTPUT}")
endif()

if (POST_CPACK_ERROR)
    message(FATAL_ERROR "Error: ${POST_CPACK_ERROR}")
endif()

# message("CMAKE_CURRENT_LIST_DIR : ${CMAKE_CURRENT_LIST_DIR}")
# message("ENV{PWD} : $ENV{PWD} ")

# message("CPACK_OUTPUT_FILE_PATH : ${CPACK_OUTPUT_FILE_PATH}")
# message("CPACK_TEMPORARY_INSTALL_DIRECTORY : ${CPACK_TEMPORARY_INSTALL_DIRECTORY}/CPack.NuGet.nuspec")
# message("NUGET_EXECUTABLE : ${NUGET_EXECUTABLE}")
# message("CPACK_OUTPUT_FILE_PATH : ${CPACK_OUTPUT_FILE_PATH}")
# message("CPACK_OUTPUT_FILE_PREFIX : ${CPACK_OUTPUT_FILE_PREFIX}")
# message("CPACK_PACKAGE_DIRECTORY : ${CPACK_PACKAGE_DIRECTORY}")

# get_cmake_property(_variableNames VARIABLES)
# list (SORT _variableNames)
# foreach (_variableName ${_variableNames})
#     message(STATUS "${_variableName}=${${_variableName}}")
# endforeach()

#
# CPACK_TEMPORARY_PACKAGE_FILE_NAME=C:/project/copperspice/nuget/build/_CPack_Packages/win64/NuGet/Copperspice-1.8.2-win64.nupkg

# -- CMAKE_CURRENT_LIST_DIR=C:/project/copperspice/nuget
# -- CMAKE_CURRENT_LIST_FILE=C:/project/copperspice/nuget/post_cpack.cmake
# -- CPACK_BUILD_SOURCE_DIRS=C:/project/copperspice/nuget;C:/project/copperspice/nuget/build
# -- CPACK_INSTALL_CMAKE_PROJECTS=C:/project/copperspice/nuget/build;Copperspice;ALL;/
# -- CPACK_NUGET_PACKAGE_HOMEPAGE_URL=https://www.copperspice.com/
# -- CPACK_OUTPUT_CONFIG_FILE=C:/project/copperspice/nuget/build/CPackConfig.cmake
# -- CPACK_OUTPUT_FILE_PATH=C:/project/copperspice/nuget/build/Copperspice-1.8.2-win64.nupkg
# -- CPACK_OUTPUT_FILE_PREFIX=C:/project/copperspice/nuget/build
# -- CPACK_PACKAGE_CONTACT=info@copperspice.com
# -- CPACK_PACKAGE_DESCRIPTION_FILE=C:/project/copperspice/nuget/DESCRIPTION.md
# -- CPACK_PACKAGE_DIRECTORY=C:/project/copperspice/nuget/build
# -- CPACK_PACKAGE_FILES=C:/project/copperspice/nuget/build/_CPack_Packages/win64/NuGet/Copperspice-1.8.2-win64/Copperspice.1.8.2.nupkg
# -- CPACK_POST_BUILD_SCRIPTS=C:/project/copperspice/nuget/post_cpack.cmake
# -- CPACK_PROPERTIES_FILE=C:/project/copperspice/nuget/build/CPackProperties.cmake
# -- CPACK_SOURCE_OUTPUT_CONFIG_FILE=C:/project/copperspice/nuget/build/CPackSourceConfig.cmake
# -- CPACK_TEMPORARY_DIRECTORY=C:/project/copperspice/nuget/build/_CPack_Packages/win64/NuGet/Copperspice-1.8.2-win64
# -- CPACK_TEMPORARY_INSTALL_DIRECTORY=C:/project/copperspice/nuget/build/_CPack_Packages/win64/NuGet/Copperspice-1.8.2-win64
# -- CPACK_TEMPORARY_PACKAGE_FILE_NAME=C:/project/copperspice/nuget/build/_CPack_Packages/win64/NuGet/Copperspice-1.8.2-win64.nupkg
# -- CPACK_TOPLEVEL_DIRECTORY=C:/project/copperspice/nuget/build/_CPack_Packages/win64/NuGet

