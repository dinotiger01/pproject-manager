#include "Engine.h"
#include <iostream>
#include <string>
#include <fstream>
#include <thread>
#include <chrono>
#include <iomanip>

// qtstuff
#include <QObject>
#include <QString>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QQuickItem>
#include <filesystem>

using namespace std;

string selfpath = "/home/FFlyingFish/Projects/potad";

namespace Engine {
    vector<project> all_projects;
    vector<proto> all_proto;
    unordered_map<string, QObject*> qqml;
    unordered_map<string, QObject*> fileMap;
    vector<QObject*> active;
    vector<QObject*> active2;
    string color = "00ffff";


    QQmlEngine* eng;

    void Engine::EngineMod::initEng(QQmlEngine *engs) {
        eng = engs;
        initDB();
    }
    void EngineMod::initDB() {
        // table project
        // id
        //name
        //description
        // path
        // logopath
        // interact date


        for (int i = 0; i < 5; i++) {
            project protest;
            proto protoest;
            protest.id = i;
            protest.name = "test " + i;
            protest.des = "sakjdhalsjkhasjdhasljdhajshdlajkshdljakshdklajhsdljhaslkdjhasljhdlkajshdlkjashdlkjahsd";
            vector<pair<string,string>> lists;
            pair<string, string> li;
            for (int j = 0; j < 5; j++) {
                li.first = "yo";
                li.second = "https://thirdspace.hackclub.com/projects/7c32bb88-3a17-4ac0-b6ea-c59d8eac0bd7";
                lists.push_back(li);
            }
            protest.links = lists;
            vector<task> tasks;
            for (int j = 0; j < 5; j++) {
                task temptask;
                temptask.id = j;
                temptask.name = "task " + j;
                temptask.done = false;
                vector<subtask> tempsub;
                for (int k = 0; k < 5; k++) {
                    subtask ahh;
                    ahh.id = k;
                    ahh.name = "subtask " + k;
                    ahh.done = false;
                    ahh.parent = j;
                    tempsub.push_back(ahh);
                }
                temptask.subtasks = tempsub;
                tasks.push_back(temptask);
            }
            protest.tasks = tasks;
            vector<string> fet;
            for (int i = 0; i< 5; i++) {
                fet.push_back("asdasdasdasd");
            }

            vector<part> teg;
            for (int i = 0; i < 5; i ++) {
                part te;
                te.name = " asdasd";
                teg.push_back(te);
            }
            protest.path = selfpath;
            protest.parts = teg;
            protest.features = fet;
            protest.notes = "* a;sklfjaslkfja;sklfslkfjsa;fkj\n     * sakjd;lkasjdklasjd\n *** \n j;lksdf;lkasd;lkasdf;lkasjf;lkjasd;lkj\n\n\n\n\n\n\n\n\n\nsadasdasdasdasd\nasdasdasdasd\nasdasdasda;lksdf';laksd'f;lkasd';lk's;dlk';lsdkf';fja;lkdsjf;lksajdf;lkajdsf;lkkjsdalhajshfkjsdhflaksjdhfkasjfdhalksjdfhafja;lkdsjf;lksajdf;lkajdsf;lkkjsdalhajshfkjsdhflaksjdhfkasjfdhalksjdfhafja;lkdsjf;lksajdf;lkajdsf;lkkjsdalhajshfkjsdhflaksjdhfkasjfdhalksjdfhafja;lkdsjf;lksajdf;lkajdsf;lkkjsdalhajshfkjsdhflaksjdhfkasjfdhalksjdfhafja;lkdsjf;lksajdf;lkajdsf;lkkjsdalhajshfkjsdhflaksjdhfkasjfdhalksjdfhafja;lkdsjf;lksajdf;lkajdsf;lkkjsdalhajshfkjsdhflaksjdhfkasjfdhalksjdfhafja;lkdsjf;lksajdf;lkajdsf;lkkjsdalhajshfkjsdhflaksjdhfkasjfdhalksjdfhafja;lkdsjf;lksajdf;lkajdsf;lkkjsdalhajshfkjsdhflaksjdhfkasjfdhalksjdfhalsdkf';lksdf';lksd'f;lksda'lfk'sadl;f'sldkf'lksdf';lksd'flks'd;lf'as;dlkf';lskf'ksad'f;lks'dflk'sa;dlfsnsad\n \n \n \n \n asd\nasd";

            protoest.id = i;
            protoest.name = "asdasdasdasd" + i;
            protoest.des = "kj;kjds;ajf;lkjasd;kfj;askdfk;jf;ksjdfkajsf;jsa;dlkj";

            all_projects.push_back(protest);
            all_proto.push_back(protoest);
        }
    }
    void EngineMod::loadQML() {
        if (!active.empty()) {
            for (QObject* i : active) {
                i->deleteLater();
            }
        }
        active.clear();

        for (proto& i: all_proto) {
            addProto(i);
        }
        for (project& i : all_projects) {
            addProj(i);
        }
        for (int i = 0; i < 5; i++) {
            addQTask("asdasdasdasdasd");
        }
    }
    void EngineMod::deselect() {
        for (QObject* i : active ) {
            i->setProperty("checked", false);
        }
        for (QObject* i : active2 ) {
            i->setProperty("checked", false);
        }
    }

    void EngineMod::setQML(QObject* com, QString str) {
        qqml[str.toStdString()] = com;
    }

    QString EngineMod::gettime() {
        const auto cur = chrono::system_clock::now();
        time_t time = chrono::system_clock::to_time_t(cur);
        stringstream ss;
        ss << put_time(localtime(&time), "%Y-%m-%d %H:%M:%S");
        return QString::fromStdString( ss.str());
    }

    QString EngineMod::getColor() {
        return QString::fromStdString(color);
    }

    void EngineMod::addProto(proto& pro) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/proto.qml")));
        // assign propertys
        QVariantMap protoProp;
        protoProp["name"] = QString::fromStdString(pro.name);
        protoProp["id"] = pro.id;
        protoProp["color"] = QString::fromStdString(color);

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active.push_back(newProto);
        // add in to the qml
        QObject* dir = qqml["protoDir"];
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }

        cout << dir << "\n";
        newProto->setParent(dir);
        QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

        QQuickItem* par = qobject_cast<QQuickItem*>(dir);
        QQuickItem* child = qobject_cast<QQuickItem*>(newProto);
        child->setParentItem(par);
    }
    void EngineMod::addProj(project& pro) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/project.qml")));
        // assign propertys
        QVariantMap protoProp;
        protoProp["id"] = pro.id;
        protoProp["name"] = QString::fromStdString(pro.name);
        protoProp["des"] = QString::fromStdString(pro.des);
        protoProp["logo"] = QString::fromStdString(pro.logo);
        protoProp["color"] = QString::fromStdString(color);

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active.push_back(newProto);
        // add in to the qml
        QObject* dir = qqml["projDir"];
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }

        cout << dir << "\n";
        newProto->setParent(dir);
        QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

        QQuickItem* par = qobject_cast<QQuickItem*>(dir);
        QQuickItem* child = qobject_cast<QQuickItem*>(newProto);

        child->setParentItem(par);
    }
    void EngineMod::addTask(task& tk) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/task.qml")));
        // assign propertys
        QVariantMap protoProp;
        protoProp["name"] = QString::fromStdString(tk.name);
        protoProp["id"] = tk.id;
        protoProp["done"] = tk.done;
        protoProp["color"] = QString::fromStdString(color);

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active2.push_back(newProto);
        // add in to the qml
        QObject* dir = qqml["taskDir"];
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }

        newProto->setParent(dir);
        QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

        QQuickItem* par = qobject_cast<QQuickItem*>(dir);
        QQuickItem* child = qobject_cast<QQuickItem*>(newProto);

        child->setParentItem(par);
        tk.dir = child;
    }
    void EngineMod::addSubTask(subtask& sub, task& par) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/subTask.qml")));
        // assign propertys
        QVariantMap protoProp;
        protoProp["name"] = QString::fromStdString(sub.name);
        protoProp["done"] = sub.done;
        protoProp["id"] = sub.id;
        protoProp["color"] = QString::fromStdString(color);

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active2.push_back(newProto);
        // add in to the qml
        QObject* dir = par.dir;
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }
        if (dir != nullptr) {
            cout << dir << "\n";
            newProto->setParent(dir);
            QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

            QQuickItem* parn = qobject_cast<QQuickItem*>(dir);
            QQuickItem* child = qobject_cast<QQuickItem*>(newProto);

            child->setParentItem(parn);
        }
    }
    void EngineMod::addlink(std::pair<std::string, std::string> &link) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/link.qml")));
        // assign propertys
        QVariantMap protoProp;
        protoProp["name"] = QString::fromStdString(link.first);
        protoProp["link"] = QString::fromStdString(link.second);
        protoProp["color"] = QString::fromStdString(color);

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active2.push_back(newProto);
        // add in to the qml
        QObject* dir = qqml["projLink"];
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }
        cout << dir << "\n";
        newProto->setParent(dir);
        QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

        QQuickItem* par = qobject_cast<QQuickItem*>(dir);
        QQuickItem* child = qobject_cast<QQuickItem*>(newProto);

        child->setParentItem(par);
    }
    void EngineMod::addPart(part &part) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/part.qml")));
        // assign propertys
        QVariantMap protoProp;
        protoProp["color"] = QString::fromStdString(color);
        protoProp["name"] = QString::fromStdString(part.name);
        string cur = part.cur + to_string(part.price);
        protoProp["cur"] = QString::fromStdString(part.cur);
        protoProp["price"] = part.price;
        string des = part.link + "\n";
        for (string& i : part.values) {
            des += "* ";
            des += i + "\n";
        }
        protoProp["des"] = QString::fromStdString(des);

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active2.push_back(newProto);
        // add in to the qml
        QObject* dir = qqml["partDir"];
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }
        cout << dir << "\n";
        newProto->setParent(dir);
        QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

        QQuickItem* par = qobject_cast<QQuickItem*>(dir);
        QQuickItem* child = qobject_cast<QQuickItem*>(newProto);

        child->setParentItem(par);
    }
    void EngineMod::addDir(string s, string parent, project& proj) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/dir.qml")));
        // assign propertys
        QVariantMap protoProp;
        std::filesystem::path p(s);
        string name = p.filename();
        protoProp["color"] = QString::fromStdString(color);
        protoProp["name"] = QString::fromStdString(name);
        int i = 0;
        while (p.parent_path() != proj.path) {
            i++;
            p = p.parent_path();
        }
        protoProp["tab"] = i;

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active2.push_back(newProto);
        // add in to the qml
        QObject* dir;
        if (parent == proj.path) {
            dir = qqml["fileDir"];
        }else {
            dir = fileMap[parent];
        }
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }
        // cout << dir << "\n";
        newProto->setParent(dir);
        QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

        QQuickItem* par = qobject_cast<QQuickItem*>(dir);
        QQuickItem* child = qobject_cast<QQuickItem*>(newProto);

        child->setParentItem(par);

        fileMap[s] = child;
    }
    void EngineMod::addfile(string s, string parent, project& proj) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/file.qml")));
        // assign propertys
        QVariantMap protoProp;
        std::filesystem::path p(s);
        string name = p.filename();
        protoProp["color"] = QString::fromStdString(color);
        protoProp["name"] = QString::fromStdString(name);
        int i = 0;
        while (p.parent_path() != proj.path) {
            i++;
            p = p.parent_path();
        }
        protoProp["tab"] = i;

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active2.push_back(newProto);
        // add in to the qml
        QObject* dir;
        if (parent == proj.path) {
            dir = qqml["fileDir"];
        }else {
            dir = fileMap[parent];
        }
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }
        // cout << dir << "\n";
        newProto->setParent(dir);
        QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

        QQuickItem* par = qobject_cast<QQuickItem*>(dir);
        QQuickItem* child = qobject_cast<QQuickItem*>(newProto);

        child->setParentItem(par);
    }
    void EngineMod::addQTask(std::string s) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/subTask.qml")));
        // assign propertys
        QVariantMap protoProp;
        protoProp["name"] = QString::fromStdString(s);
        protoProp["done"] =false;
        protoProp["x"] = 0;
        protoProp["color"] = QString::fromStdString(color);

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active.push_back(newProto);
        // add in to the qml
        QObject* dir = qqml["homeDir"];
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }
        if (dir != nullptr) {
            cout << dir << "\n";
            newProto->setParent(dir);
            QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

            QQuickItem* parn = qobject_cast<QQuickItem*>(dir);
            QQuickItem* child = qobject_cast<QQuickItem*>(newProto);

            child->setParentItem(parn);
        }
    }

    void EngineMod::dircheck(string s, project& proj){
        for (const auto & entry : std::filesystem::directory_iterator(s)) {

            std::filesystem::path temp(entry.path());

            std::filesystem::path p(entry);
            if (std::filesystem::is_directory(p)) {
                addDir(entry.path(),temp.parent_path(), proj);
                dircheck(entry.path(), proj);
            }else if (std::filesystem::is_regular_file(p)) {
                addfile(entry.path(), temp.parent_path(), proj);
            }
        }
    }

    void EngineMod::selProj(int id) {
        for (QObject* i: active2) {
            i->deleteLater();
        }
        active2.clear();
        project proj;
        for (project& i: all_projects) {
            if(i.id == id) {
                proj = i;
                break;
            }
        }
        qqml["projRName"]->setProperty("text", QString::fromStdString(proj.name));
        string fet;
        for (string& i: proj.features) {
            fet += "* ";
            fet += i;
            fet += "\n";
        }
        qqml["projRfeture"]->setProperty("text", QString::fromStdString(fet));

        qqml["linkName"]->setProperty("text", QString::fromStdString(proj.name));
        qqml["noteName"]->setProperty("text", QString::fromStdString(proj.name));
        qqml["fileName"]->setProperty("text", QString::fromStdString(proj.name));
        qqml["partName"]->setProperty("text", QString::fromStdString(proj.name));
        qqml["todoName"]->setProperty("text", QString::fromStdString(proj.name));

        qqml["projNotes"]->setProperty("text", QString::fromStdString(proj.notes));

        for (task& i: proj.tasks) {
            addTask(i);
            for (subtask& j : i.subtasks) {
                addSubTask(j,i);
            }
        }
        for (pair<string, string>& i: proj.links ) {
            addlink(i);
        }
        for (part& i : proj.parts) {
            addPart(i);
        }
        dircheck(proj.path, proj);

    }

    void EngineMod::selProto(int id) {
        proto pro;
        for (proto& i: all_proto) {
            if (i.id == id) {
                pro = i;
                break;
            }
        }

        qqml["protoRName"]->setProperty("text", QString::fromStdString(pro.name));
        qqml["protoRDes"]->setProperty("text", QString::fromStdString(pro.des));
    }
}


