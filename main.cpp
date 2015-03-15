#include <QGuiApplication>

#include <QQuickView>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QFontDatabase>

#include <QStandardPaths>
#include <QDir>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //setenv("QML_IMPORT_TRACE", "1", 1);
    setenv("PYTHONVERBOSE", "2", 2);

    QQmlApplicationEngine engine;
    engine.addImportPath(":/modules/gui_modules/gui_qt5/qml/universal_components/controls/");
    engine.load(QUrl("qrc:/modules/gui_modules/gui_qt5/qml/main.qml"));

    return app.exec();
}
