//
// Created by FFlyingFish on 8/18/26.
//

#ifndef PROJECT_ENGINE_H
#define PROJECT_ENGINE_H


#include <QObject>
#include <QtQml>
#include <QString>

namespace  Engine {
    class EngineMod: public QObject {
        Q_OBJECT
        QML_ELEMENT
    public:
        explicit EngineMod(QObject *parent = nullptr) : QObject(parent){}
        void initEng(QQmlEngine* eng);
    };
}


#endif //QTQMLCPPAPP_ENGINE_H
