TEMPLATE = app

QT += quick qml
SOURCES += src/main.cpp

RESOURCES += src/silly.qrc

CONFIG += lrelease embed_translations

TRANSLATIONS += \
    src/qml/translations/qml_en.ts \
    src/qml/translations/qml_fr.ts \
    src/qml/translations/qml_de.ts
