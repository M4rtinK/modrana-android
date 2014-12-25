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
    //setenv("PYTHONVERBOSE", "2", 1);


    // gPodder storage directory
    //QString data(QDir(QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation)).filePath("gPodder"));
    //qputenv("GPODDER_HOME", data.toUtf8());

    // gPodder QML UI fonts and themeing
    //QFontDatabase::addApplicationFont(":/touch/icons/iconic_fill.ttf");
    //QFontDatabase::addApplicationFont(":/touch/fonts/source-sans-pro.extralight.ttf");

    //QQmlEngine engine;
    //engine.addImportPath(":/modrana/modules/gui_modules/gui_qt5/qml/universal_components/controls/");
    //engine.addImportPath("qrc:/modrana/modules/gui_modules/gui_qt5/qml/universal_components/controls/");

    //QQuickView view;
    //view.engine()->addImportPath(":/modules/gui_modules/gui_qt5/qml/universal_components/controls/");
    //view.engine()->addImportPath("qrc:/modules/gui_modules/gui_qt5/qml/universal_components/controls/");
    QQmlApplicationEngine engine;
    engine.addImportPath(":/modules/gui_modules/gui_qt5/qml/universal_components/controls/");
    engine.load(QUrl("qrc:/modules/gui_modules/gui_qt5/qml/main.qml"));
    //view.setSource(QUrl("qrc:/modules/gui_modules/gui_qt5/qml/main.qml"));
    //view.setResizeMode(QQuickView::SizeRootObjectToView);
    //view.show();

    return app.exec();
}
