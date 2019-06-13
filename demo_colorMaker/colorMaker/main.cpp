#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "colorMaker.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<ColorMaker>("an.qt.ColorMaker", 1, 0, "ColorMaker");//注册QML类型

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("colorMaker", new ColorMaker);


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
