cmake_minimum_required(VERSION 3.10)
project(sqlite C)

set(CMAKE_C_STANDARD 99)

set(SQLITE_SOURCES
    sqlite3.c
)

include_directories(
    ${PROJECT_SOURCE_DIR}
)

if(WIN32)
    # Windows: сборка DLL с MSVC
    add_library(sqlite3 SHARED ${SQLITE_SOURCES})
    set_target_properties(sqlite3 PROPERTIES
        OUTPUT_NAME "sqlite3"
        WINDOWS_EXPORT_ALL_SYMBOLS TRUE
    )
else()
    # Linux: сборка shared object с gcc
    add_library(sqlite3 SHARED ${SQLITE_SOURCES})
    set_target_properties(sqlite3 PROPERTIES
        OUTPUT_NAME "sqlite3"
        POSITION_INDEPENDENT_CODE TRUE
    )
    
    if(CMAKE_COMPILER_IS_GNUCC)
        target_compile_options(sqlite3 PRIVATE -O3 -fPIC)
    endif()
endif()

install(TARGETS sqlite3
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)
install(FILES sqlite3.h sqlite3ext.h DESTINATION include)