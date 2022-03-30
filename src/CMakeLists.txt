cmake_minimum_required(VERSION 3.22)
find_package(Qt5 COMPONENTS Qml Quick LinguistTools REQUIRED)
set(CMAKE_AUTORCC ON)
set(TRANSLATIONS 
    qml/translations/qml_en.ts
    qml/translations/qml_fr.ts
    qml/translations/qml_de.ts
)
qt5_create_translation(QM_FILES ${CMAKE_CURRENT_SOURCE_DIR} ${TRANSLATIONS})
add_custom_target(build-translations ALL 
    COMMENT "Building translation files"
    DEPENDS ${QM_FILES})
configure_file(translations.qrc ${CMAKE_BINARY_DIR} COPYONLY)
qt5_add_resources(QRC_RESOURCES "silly.qrc" ${CMAKE_BINARY_DIR}/translations.qrc)

add_executable(silly main.cpp 
    "${QRC_RESOURCES}"
    "${QM_FILES}"
)
target_compile_features(silly PUBLIC cxx_std_17)
set_target_properties(silly PROPERTIES AUTOMOC ON AUTORCC ON)
target_link_libraries(silly PRIVATE Qt5::Quick Qt5::Qml)
target_include_directories(silly
    PUBLIC
        $<INSTALL_INTERFACE:.>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
)
install(TARGETS silly)
