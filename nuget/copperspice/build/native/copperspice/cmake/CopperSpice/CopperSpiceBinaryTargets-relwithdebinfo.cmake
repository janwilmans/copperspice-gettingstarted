#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "CopperSpice::lconvert" for configuration "RelWithDebInfo"
set_property(TARGET CopperSpice::lconvert APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(CopperSpice::lconvert PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/bin/lconvert.exe"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::lconvert )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::lconvert "${_IMPORT_PREFIX}/bin/lconvert.exe" )

# Import target "CopperSpice::lrelease" for configuration "RelWithDebInfo"
set_property(TARGET CopperSpice::lrelease APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(CopperSpice::lrelease PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/bin/lrelease.exe"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::lrelease )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::lrelease "${_IMPORT_PREFIX}/bin/lrelease.exe" )

# Import target "CopperSpice::lupdate" for configuration "RelWithDebInfo"
set_property(TARGET CopperSpice::lupdate APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(CopperSpice::lupdate PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/bin/lupdate.exe"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::lupdate )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::lupdate "${_IMPORT_PREFIX}/bin/lupdate.exe" )

# Import target "CopperSpice::rcc" for configuration "RelWithDebInfo"
set_property(TARGET CopperSpice::rcc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(CopperSpice::rcc PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/bin/rcc.exe"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::rcc )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::rcc "${_IMPORT_PREFIX}/bin/rcc.exe" )

# Import target "CopperSpice::uic" for configuration "RelWithDebInfo"
set_property(TARGET CopperSpice::uic APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(CopperSpice::uic PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/bin/uic.exe"
  )

list(APPEND _IMPORT_CHECK_TARGETS CopperSpice::uic )
list(APPEND _IMPORT_CHECK_FILES_FOR_CopperSpice::uic "${_IMPORT_PREFIX}/bin/uic.exe" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
