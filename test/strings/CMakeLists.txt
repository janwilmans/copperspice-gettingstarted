project(copperspice_tests)

add_executable(${PROJECT_NAME}
  main.cpp
  test_fonts.cpp
 )

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}
)

target_link_libraries(${PROJECT_NAME} PRIVATE
  CopperSpice::CsCore
  CopperSpice::CsGui
  CopperSpice::CsWebKit
  CopperSpice::CsNetwork
)

target_compile_options(${PROJECT_NAME} PRIVATE 
    -ID:/project2/copperspice-msvc/src/gui/text 
    -ID:/project2/copperspice-msvc/src/gui/painting
    -ID:/project2/copperspice-msvc/src/core/tools
)


if(MSVC)
  target_link_options(${PROJECT_NAME} PRIVATE
#    /SUBSYSTEM:WINDOWS
  )
endif()

install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_PREFIX})

# Copy the libraries and plugins necessary for our application to our install path.
cs_copy_library(CsCore)
cs_copy_library(CsGui)

cs_copy_plugins(CsGui)
