#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "CopperSpice::CsCore" for configuration "Debug"
set_property(TARGET CopperSpice::CsCore APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CopperSpice::CsCore PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CsCore1.7.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CsCore1.7.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::CsCore )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::CsCore "${_IMPORT_PREFIX}/lib/CsCore1.7.lib" "${_IMPORT_PREFIX}/bin/CsCore1.7.dll" )

# Import target "CopperSpice::CsGui" for configuration "Debug"
set_property(TARGET CopperSpice::CsGui APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CopperSpice::CsGui PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CsGui1.7.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CsGui1.7.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::CsGui )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::CsGui "${_IMPORT_PREFIX}/lib/CsGui1.7.lib" "${_IMPORT_PREFIX}/bin/CsGui1.7.dll" )

# Import target "CopperSpice::CsMultimedia" for configuration "Debug"
set_property(TARGET CopperSpice::CsMultimedia APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CopperSpice::CsMultimedia PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CsMultimedia1.7.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CsMultimedia1.7.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::CsMultimedia )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::CsMultimedia "${_IMPORT_PREFIX}/lib/CsMultimedia1.7.lib" "${_IMPORT_PREFIX}/bin/CsMultimedia1.7.dll" )

# Import target "CopperSpice::CsNetwork" for configuration "Debug"
set_property(TARGET CopperSpice::CsNetwork APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CopperSpice::CsNetwork PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CsNetwork1.7.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "CopperSpice::CsCore"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CsNetwork1.7.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::CsNetwork )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::CsNetwork "${_IMPORT_PREFIX}/lib/CsNetwork1.7.lib" "${_IMPORT_PREFIX}/bin/CsNetwork1.7.dll" )

# Import target "CopperSpice::CsOpenGL" for configuration "Debug"
set_property(TARGET CopperSpice::CsOpenGL APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CopperSpice::CsOpenGL PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CsOpenGL1.7.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CsOpenGL1.7.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::CsOpenGL )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::CsOpenGL "${_IMPORT_PREFIX}/lib/CsOpenGL1.7.lib" "${_IMPORT_PREFIX}/bin/CsOpenGL1.7.dll" )

# Import target "CopperSpice::CsScript" for configuration "Debug"
set_property(TARGET CopperSpice::CsScript APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CopperSpice::CsScript PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CsScript1.7.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "CopperSpice::CsCore"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CsScript1.7.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::CsScript )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::CsScript "${_IMPORT_PREFIX}/lib/CsScript1.7.lib" "${_IMPORT_PREFIX}/bin/CsScript1.7.dll" )

# Import target "CopperSpice::CsSql" for configuration "Debug"
set_property(TARGET CopperSpice::CsSql APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CopperSpice::CsSql PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CsSql1.7.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "CopperSpice::CsCore"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CsSql1.7.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::CsSql )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::CsSql "${_IMPORT_PREFIX}/lib/CsSql1.7.lib" "${_IMPORT_PREFIX}/bin/CsSql1.7.dll" )

# Import target "CopperSpice::CsSvg" for configuration "Debug"
set_property(TARGET CopperSpice::CsSvg APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CopperSpice::CsSvg PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CsSvg1.7.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "CopperSpice::CsCore;CopperSpice::CsGui"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CsSvg1.7.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::CsSvg )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::CsSvg "${_IMPORT_PREFIX}/lib/CsSvg1.7.lib" "${_IMPORT_PREFIX}/bin/CsSvg1.7.dll" )

# Import target "CopperSpice::CsWebKit" for configuration "Debug"
set_property(TARGET CopperSpice::CsWebKit APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CopperSpice::CsWebKit PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CsWebKit1.7.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "CopperSpice::CsCore;CopperSpice::CsGui;CopperSpice::CsNetwork;CopperSpice::CsScript"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CsWebKit1.7.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::CsWebKit )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::CsWebKit "${_IMPORT_PREFIX}/lib/CsWebKit1.7.lib" "${_IMPORT_PREFIX}/bin/CsWebKit1.7.dll" )

# Import target "CopperSpice::CsXml" for configuration "Debug"
set_property(TARGET CopperSpice::CsXml APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CopperSpice::CsXml PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CsXml1.7.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "CopperSpice::CsCore"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CsXml1.7.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::CsXml )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::CsXml "${_IMPORT_PREFIX}/lib/CsXml1.7.lib" "${_IMPORT_PREFIX}/bin/CsXml1.7.dll" )

# Import target "CopperSpice::CsXmlPatterns" for configuration "Debug"
set_property(TARGET CopperSpice::CsXmlPatterns APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CopperSpice::CsXmlPatterns PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CsXmlPatterns1.7.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "CopperSpice::CsCore;CopperSpice::CsNetwork"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CsXmlPatterns1.7.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::CsXmlPatterns )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::CsXmlPatterns "${_IMPORT_PREFIX}/lib/CsXmlPatterns1.7.lib" "${_IMPORT_PREFIX}/bin/CsXmlPatterns1.7.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
