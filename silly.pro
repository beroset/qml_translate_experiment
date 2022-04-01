TEMPLATE = app

QT += quick qml
SOURCES += src/main.cpp

RESOURCES += src/silly.qrc

CONFIG += lrelease embed_translations

TRANSLATIONS += \
    src/translations/qml_en.ts \
    src/translations/qml_fr.ts \
    src/translations/qml_de.ts
