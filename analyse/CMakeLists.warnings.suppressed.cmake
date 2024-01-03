# the suppressions are in a separate file because we need them 
# _after_ all targets have been created

message("-- Suppress MSVC Warnings on CsWebKit")
 # disable some warnings for 3rdparty code
 target_compile_options(CsWebKit PRIVATE
    /wd4131 # uses old-style declarator 
 )

 target_compile_definitions(CsGui PRIVATE
   _CRT_SECURE_NO_WARNINGS # ignores warnings from freetype and harfbuzz
 )

 