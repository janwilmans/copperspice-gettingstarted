set(SCRIPT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/analyse")

if (MSVC)
   message("-- Enable MSVC Warnings")

   set(CS_WARNING_DEFAULTS
   /W3            # Baseline reasonable warnings
   /w14242        # 'identifier': conversion from 'type1' to 'type1', possible loss of data
   /w14254        # 'operator': conversion from 'type1:field_bits' to 'type2:field_bits', possible loss of data
   /w14263        # 'function': member function does not override any base class virtual member function
   /w14265        # 'classname': class has virtual functions, but destructor is not virtual instances of this class may not
                  # be destructed correctly
   /w14287        # 'operator': unsigned/negative constant mismatch
   /we4289        # nonstandard extension used: 'variable': loop control variable declared in the for-loop is used outside
                  # the for-loop scope
   /w14296        # 'operator': expression is always 'boolean_value'
   /w14311        # 'variable': pointer truncation from 'type1' to 'type2'
   /w14545        # expression before comma evaluates to a function which is missing an argument list
   /w14546        # function call before comma missing argument list
   /w14547        # 'operator': operator before comma has no effect; expected operator with side-effect
   /w14549        # 'operator': operator before comma has no effect; did you intend 'operator'?
   /w14555        # expression has no effect; expected expression with side- effect
   /w14619        # pragma warning: there is no warning number 'number'
   /w14640        # Enable warning on thread un-safe static member initialization
   /w14826        # Conversion from 'type1' to 'type_2' is sign-extended. This may cause unexpected runtime behavior.
   /w14905        # wide string literal cast to 'LPSTR'
   /w14906        # string literal cast to 'LPWSTR'
   /w14928        # illegal copy-initialization; more than one user-defined conversion has been implicitly applied
   /wd4100        # off: unreferenced formal parameter
   /wd4242        # off: 'argument': conversion from 'int' to 'quint16', possible loss of data
   /wd4244        # off: conversion from A to B
   /wd4267        # off: conversion from S to T possible loss of data
   /wd4291        # off: no matching operator delete found; memory will not be freed if initialization throws an exception
   /wd5030        # off: attribute is not recognized
   )
   add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:${CS_WARNING_DEFAULTS}>")
endif()

add_executable(show_rsp EXCLUDE_FROM_ALL ${SCRIPT_DIR}/show_rsp/main.cpp)

add_custom_target(touch_rsp_file COMMAND show_rsp WORKING_DIRECTORY ${CMAKE_BINARY_DIR})
add_dependencies(touch_rsp_file show_rsp)

file(TOUCH ${CMAKE_BINARY_DIR}/option_test.cpp)

add_executable(option_test EXCLUDE_FROM_ALL ${CMAKE_BINARY_DIR}/option_test.cpp)
set_target_properties(option_test PROPERTIES CXX_COMPILER_LAUNCHER "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/show_rsp.exe")
add_dependencies(option_test touch_rsp_file)

 message("-- Generate all targets")