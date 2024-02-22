
file(GLOB HOMEBREW_HEADER_LIST CONFIGURE_DEPENDS "${${PROJECT_NAME}_SOURCE_DIR}/include/switchHomebrew/*.hpp")
add_executable(${PROJECT_NAME}
        main.cpp
)
target_include_directories(${PROJECT_NAME} PUBLIC ../include/)

nx_generate_nacp(
        OUTPUT "${${PROJECT_NAME}_OUTPUT}/${PROJECT_NAME}.nacp"
        NAME "Homebrew de Test"
        AUTHOR "Mathilde Pascal"
)

nx_create_nro(${PROJECT_NAME}
        OUTPUT "${${PROJECT_NAME}_OUTPUT}/${PROJECT_NAME}.nro"
        ICON "${CMAKE_SOURCE_DIR}/resource/icon.jpg"
        NACP "${${PROJECT_NAME}_OUTPUT}/${PROJECT_NAME}.nacp"
)