cmake_minimum_required(VERSION 3.20)
include("cmake/Switch.cmake")

project(SwitchHomebrew VERSION 4.1.1)

set(${PROJECT_NAME}_OUTPUT              "${CMAKE_BINARY_DIR}/output/${PROJECT_NAME}")

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${${PROJECT_NAME}_OUTPUT})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${${PROJECT_NAME}_OUTPUT})
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
    set(CMAKE_CXX_STANDARD 23)
    set(CMAKE_CXX_EXTENSIONS OFF)
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)

    # Docs only available if this is the main app
    find_package(Doxygen)
    if(Doxygen_FOUND)
        add_subdirectory(docs)
    else()
        message(STATUS "Doxygen not found, not building docs")
    endif()
endif()

add_subdirectory(src)