//
// Created by FFlyingFish on 8/18/26.
//

#ifndef PROJECT_ENGINE_H
#define PROJECT_ENGINE_H

#include <QObject>
#include <QtQml>
#include <QString>

struct subtask{
    int id;
    std::string name;
    bool done;
    int parent;
};
struct task{
    int id;
    std::string name;
    bool done;
    QObject* dir;
    std::vector<subtask> subtasks;
};
struct part {
    int id;
    int price;
    std::string cur;
    std::string name;
    std::string link;
    std::vector<std::string> values;
};
struct project {
    int id;//
    std::string name;//
    std::string des;//
    std::string logo;

    std::string path;
    std::vector<std::string> features;//

    std::vector<std::pair<std::string, std::string>> links;//
    std::vector<part> parts;//
    std::string notes;//

    std::vector<task> tasks;//
};
struct proto {
    int id;
    std::string name;
    std::string des;
    std::string logo;
};

namespace  Engine {
    class EngineMod: public QObject {
        Q_OBJECT
        QML_ELEMENT
    public:
        explicit EngineMod(QObject *parent = nullptr) : QObject(parent){}
        Q_INVOKABLE void setQML(QObject*, QString);
        Q_INVOKABLE void loadQML();
        Q_INVOKABLE void deselect();
        Q_INVOKABLE QString gettime();
        Q_INVOKABLE QString getColor();

        Q_INVOKABLE void selProj(int id);
        Q_INVOKABLE void selProto(int id);
        void dircheck(std::string s, project& proj);
        void initEng(QQmlEngine* eng);
        void initDB();
        void addProto(proto& pro);
        void addProj(project& pro);
        void addTask(task& tk);
        void addSubTask(subtask& sub, task& par);
        void addlink(std::pair<std::string, std::string>& link);
        void addPart(part& part);
        void addDir(std::string s, std::string parent, project& proj);
        void addfile(std::string s, std::string parent, project& proj);
        void addQTask(std::string s);
    };
}


#endif //QTQMLCPPAPP_ENGINE_H
