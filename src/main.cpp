#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/");
    engine.load(QUrl("qrc:/qml-i18n.qml"));

    return app.exec();
}
