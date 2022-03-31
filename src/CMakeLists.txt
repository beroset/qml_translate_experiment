cmake_minimum_required(VERSION 3.22)
find_package(Qt5 COMPONENTS Qml Quick LinguistTools REQUIRED)
set(TRANSLATIONS 
    qml/translations/qml_en.ts
    qml/translations/qml_fr.ts
    qml/translations/qml_de.ts
)
qt5_create_translation(QM_FILES ${CMAKE_CURRENT_SOURCE_DIR} ${TRANSLATIONS})

function (qt5_create_translation_qrc target) 
    set(options)
    set(oneValueArgs)
    set(multiValueArgs OPTIONS)

    cmake_parse_arguments(_XLAT "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    set(xlat_files ${_XLAT_UNPARSED_ARGUMENTS})
    set(xlat_options ${_XLAT_OPTIONS})
    set(qrcContents "<RCC>\n  <qresource prefix=\"i18n\">\n")
    foreach(iter ${xlat_files})
        get_filename_component(baseqm ${iter} NAME)
        string(APPEND qrcContents "    <file alias=\"${baseqm}\">")
        string(APPEND qrcContents "${CMAKE_CURRENT_BINARY_DIR}/${baseqm}</file>\n")
    endforeach()
    string(APPEND qrcContents "  </qresource>\n</RCC>\n")
    file(GENERATE OUTPUT ${target} CONTENT "${qrcContents}")
    add_custom_target(${target} ALL DEPENDS ${xlat_files})
endfunction()

qt5_create_translation_qrc(xlat.qrc "${QM_FILES}")

add_executable(silly 
    main.cpp 
    silly.qrc
    xlat.qrc
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
