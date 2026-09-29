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
    int id;
    std::string name;
    std::string des;
    std::string logo;
    std::string notes;
    std::string path;

    std::vector<std::string> features;
    std::vector<std::pair<std::string, std::string>> links;
    std::vector<part> parts;
    std::vector<task> tasks;
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
        Q_INVOKABLE static void setQML(QObject*, QString);
        Q_INVOKABLE void loadQML();
        Q_INVOKABLE static void deselect();

        Q_INVOKABLE void changeNotes(QString Qs, int id);
        Q_INVOKABLE void changePath(QString Qs, int id);
        Q_INVOKABLE void changeName(QString Qs, int id);
        Q_INVOKABLE void changeDes(QString Qs, int id);
        Q_INVOKABLE void changeLogo(QString Qs, int id);

        Q_INVOKABLE void changeFet(QString Qs, int dex, int id);
        Q_INVOKABLE void changeLink(QString name, QString link, int dex, int id);

        Q_INVOKABLE void changePart(std::vector<QString>, int id);//here
        Q_INVOKABLE void changeTask(QString QS, int dex, int id);
        Q_INVOKABLE void changeSubTask(QString Qs, int dex, int dexx, int id);

        Q_INVOKABLE static QString gettime();
        Q_INVOKABLE static QString getColor();

        Q_INVOKABLE static QString getLinkName(int id, int dex);
        Q_INVOKABLE static QString getLinkLink(int id, int dex);
        Q_INVOKABLE static int getLinkSize(int id);

        Q_INVOKABLE static QString getPartName(int id, int dex);
        Q_INVOKABLE static QString getPartLink(int id, int dex);
        Q_INVOKABLE static QString getPartCur(int id, int dex);
        Q_INVOKABLE static int getPartSize(int id);
        Q_INVOKABLE static int getPartVSize(int id, int dex);
        Q_INVOKABLE static int getPartPrice(int id, int dex);
        Q_INVOKABLE static QString getPartValue(int id, int dex, int dexs);

        Q_INVOKABLE static QString getPath(int id);

        Q_INVOKABLE static QString getTaskName(int id, int dex);
        Q_INVOKABLE static QString getSubTaskName(int id, int dex, int dexs);
        Q_INVOKABLE static int getSubTaskSize(int id, int dex);
        Q_INVOKABLE static int getTaskSize(int id);

        Q_INVOKABLE void selProj(int id);
        Q_INVOKABLE void selProto(int id);
        void dircheck(std::string s, project& proj);
        void initEng(QQmlEngine* eng);
        static void initDB();
        static void addProto(proto& pro);
        static void addProj(project& pro);
        static void addTask(task& tk);
        static void addSubTask(subtask& sub, task& par);
        static void addlink(std::pair<std::string, std::string>& link);
        static void addPart(part& part);
        static void addDir(std::string s, std::string parent, project& proj);
        static void addfile(std::string s, std::string parent, project& proj);
        static void addQTask(std::string s);
    };
}


#endif //QTQMLCPPAPP_ENGINE_H
