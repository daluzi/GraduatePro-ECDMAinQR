#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include <QZXing.h>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

//    QZXing::registerQMLTypes();
//    QZXing::registerQMLImageProvider(engine);
//    engine.addImportPath( QString("qrc:/"));

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}

