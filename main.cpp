#include <QTranslator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Engine.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


    Engine::EngineMod Engine;
    engine.rootContext()->setContextProperty("engin", &Engine);
    Engine.initEng(&engine);


    engine.load(url);

    return app.exec();
}