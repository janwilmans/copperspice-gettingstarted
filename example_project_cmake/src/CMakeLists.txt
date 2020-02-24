project(CompiledUIControl)

# run uic to generate source
COPPERSPICE_RESOURCES(
   ${CMAKE_CURRENT_SOURCE_DIR}/mainwindow.ui
)

add_executable(${PROJECT_NAME}
  mainwindow.ui
  main.cpp
)

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}
)

target_link_libraries(${PROJECT_NAME} PRIVATE
  CopperSpice::CsCore
  CopperSpice::CsGui
)

if(MSVC)
  target_link_options(${PROJECT_NAME} PRIVATE
    /SUBSYSTEM:WINDOWS
  )
endif()

install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_PREFIX})

# Copy the libraries and plugins necessary for our application to our install path.
cs_copy_library(CsCore)
cs_copy_library(CsGui)

cs_copy_plugins(CsGui)
