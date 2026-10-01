#include <QTranslator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Engine.h"
#include <iostream>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/qt/qml/EngineMod/QML/main.qml"));

    Engine::EngineMod Engine;
    engine.rootContext()->setContextProperty("engin", &Engine);
    Engine.initEng(&engine);


    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url, &Engine](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl) {
            // qCritical() << "ERROR: QML Engine failed to load the root object!";
            QCoreApplication::exit(-1);
            return;
        }
        Engine.loadQML();
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}