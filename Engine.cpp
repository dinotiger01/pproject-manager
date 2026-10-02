#include "Engine.h"
#include <iostream>
#include <string>
#include <fstream>
#include <thread>
#include <chrono>
#include <iomanip>

// qtstuff
#include <complex>
#include <QObject>
#include <QString>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QQuickItem>
#include <filesystem>
#include <nlohmann/json.hpp>

using namespace std;

namespace Engine {
    vector<project> all_projects;
    vector<proto> all_proto;
    unordered_map<string, QObject*> qqml;
    unordered_map<filesystem::path, QObject*> fileMap;
    vector<string> all_home;
    vector<QObject*> active;
    vector<QObject*> active2;
    string color = "";


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


        /*for (int i = 0; i < 5; i++) {
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
            for (int j = 0; j < 5; j ++) {
                part te;
                te.id = j;
                te.price = 5* j;
                te.name = " asdasd";
                te.cur= "$";
                te.link = "asdasdasdasdasd";
                vector<string> ghg;
                for (int k = 0; k < 5; k++ ) {
                    ghg.push_back("js;dfkljasd;lkjas;dkf");
                }
                te.values = ghg;
                teg.push_back(te);
            }
            protest.path = selfpath;
            protest.parts = teg;
            protest.features = fet;
            protest.notes = "* a;sklfjaslkfja;sklfsasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdlkfjsa;fkj\n     * sakjd;lkasjdklasjd\n *** \n j;lksdflkas\n\nsdasd\n\nasdasdasdasd\n\nasd\n\nasd\n\nasd\n\nasd\n\nasd\n\nasd\n\nads\n\nasd\n\nasdasd\n\nasdasd\n\nasdasd\n\nasdasd\n\nasdasd\n\nasdasd\n\nasdasd\n\nasdasd";



            all_projects.push_back(protest);
        }*/
        //json
        all_home.clear();
        all_projects.clear();
        all_proto.clear();
        ifstream file("EngineMod/JSON/DATA.json");
        //proto
        if (file.is_open()) {
            nlohmann::json data = nlohmann::json::parse(file);
            if (data.contains("color")) {
                color = data["color"];
            }
            if (data.contains("proto")) {
                for (int i = 0;i < data["proto"].size();i++) {
                    proto temp;
                    temp.id = i;
                    temp.name = data["proto"][i]["name"];
                    temp.des = data["proto"][i]["des"];
                    all_proto.push_back(temp);
                }
            }
            if (data.contains("proj")) {
                for (int i = 0; i < data["proj"].size();i++) {
                    project temp;
                    temp.id = i;
                    temp.path = data["proj"][i]["path"];
                    all_projects.push_back(temp);
                }
            }
            if (data.contains("home")) {
                for (int i = 0; i < data["home"].size();i++) {
                    all_home.push_back(data["home"][i]);
                }
            }
            file.close();
        }else {
            cout << "somthinghapend" << "\n";
        }
        //projects
        for (project& i: all_projects) {
            ifstream pfile(i.path + "/managerData/DATA.json");
            if(pfile.is_open()) {
                nlohmann::json data = nlohmann::json::parse(pfile);
                if (data.contains("name")) {
                    i.name = data["name"];
                }
                if (data.contains("logo")) {
                    i.logo = data["logo"];
                }
                if (data.contains("des")) {
                    i.des = data["des"];
                }
                if (data.contains("notes")) {
                    i.notes = data["note"];
                }
                if (data.contains("fet")) {
                    i.features = data["fet"];
                }
                if (data.contains("link")) {
                    for (auto& j : data["link"]) {
                        pair<string, string> temp;
                        if (j.contains("name")) {
                            temp.first = j["name"];
                        }
                        if (j.contains("link")) {
                            temp.second = j["link"];
                        }
                        i.links.push_back(temp);
                    }
                }
                if (data.contains("part")) {
                    for (auto& j : data["part"]) {
                        part temp;
                        if (j.contains("name")) {
                            temp.name = j["name"];
                        }
                        if (j.contains("link")) {
                            temp.link = j["link"];
                        }
                        if (j.contains("cur")) {
                            temp.cur = j["cur"];
                        }
                        if (j.contains("price")) {
                            temp.price = j["price"];
                        }
                        if (j.contains("valeue")) {
                            temp.values = j["value"];
                        }
                        i.parts.push_back(temp);
                    }
                }
                if (data.contains("task")) {
                    for (auto& j : data["task"]) {
                        task temp;
                        if (j.contains("done")) {
                            temp.done = j["done"];
                        }
                        if (j.contains("name")) {
                            temp.name = j["name"];
                        }
                        for (auto& k : j["sub"]) {
                            subtask semp;
                            if (k.contains("name")) {
                                semp.name = k["name"];
                            }
                            if (k.contains("done")) {
                                semp.done = k["done"];
                            }
                            temp.subtasks.push_back(semp);
                        }
                        i.tasks.push_back(temp);
                    }
                }

                pfile.close();
            }else {
                cerr << "project file missing?: " << i.path << "\n";
            }
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
        for (int i = 0; i < all_home.size(); i++) {
            addQTask(all_home[i], i);
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

    void EngineMod::changeColor(QString Qs) {
        nlohmann::json data;
        ifstream pfile("EngineMod/JSON/DATA.json");
        if(pfile.is_open()) {
            data = nlohmann::json::parse(pfile);
            data["color"] = Qs.toStdString();
            pfile.close();
        }else {
            cerr << "project file missing?: " << "\n";
        }
        ofstream file("EngineMod/JSON/DATA.json");
        if (file.is_open()) {
            file << data.dump(4);
            file.close();
        }
        initDB();
        loadQML();
        string code = Qs.toStdString();
        bool valid = true;
        if (code.size() == 6) {
            for (char& i: code) {
                if (i != '0' && i != '1' && i != '2' && i != '3' && i != '4' && i != '5' && i != '6' && i != '7' && i != '8' && i != '9' && i != 'a' && i != 'b' && i != 'b' && i != 'd' && i != 'e' && i != 'f') {
                    valid = false;
                }
            }
            if (valid) {
                nlohmann::json data;
                ifstream pfile("EngineMod/JSON/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    data["color"] = code;
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << "\n";
                }
                ofstream file("EngineMod/JSON/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                initDB();
                loadQML();
                qqml["root"]->setProperty("hover", "#80" + QString::fromStdString(color));
                qqml["root"]->setProperty("unactive", "#40" + QString::fromStdString(color));
                qqml["root"]->setProperty("active", "#c0" + QString::fromStdString(color));
                qqml["root"]->setProperty("clear", "#00" + QString::fromStdString(color));
                qqml["root"]->setProperty("stadic", "#c0" + QString::fromStdString(color));
            }
        }
    }

    QString EngineMod::getName(int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                return QString::fromStdString(i.name);
            }
        }
    }
    QString EngineMod::getDes(int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                return QString::fromStdString(i.des);
            }
        }
    }
    QString EngineMod::getLogo(int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                return QString::fromStdString(i.logo);
            }
        }
    }
    QString EngineMod::getFet(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                if (dex >= i.features.size()) {
                    return "PLACEHOLDER";
                }else{
                    return QString::fromStdString(i.features[dex]);
                }
            }
        }
    }
    int EngineMod::getFetSize(int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                return i.features.size();
            }
        }
    }

    QString EngineMod::getLinkName(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                if (dex >= i.links.size()) {
                    return "PLACEHOLDER";
                }else{
                    return QString::fromStdString(i.links[dex].first);
                }
            }
        }
    }
    QString EngineMod::getLinkLink(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                cout << "link " << dex << "\n";
                if (dex >= i.links.size()) {
                    return "PLACEHOLDER";
                }else{
                    return QString::fromStdString(i.links[dex].second);
                }
            }
        }
    }
    int EngineMod::getLinkSize(int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                return i.links.size();
                break;
            }
        }
        return 0;
    }

    QString EngineMod::getPartName(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                if (dex >= i.parts.size()) {
                    return "PLACEHOLDER";
                }else{
                    return QString::fromStdString(i.parts[dex].name);
                }
            }
        }
    }
    QString EngineMod::getPartLink(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                if (dex >= i.parts.size()) {
                    return "PLACEHOLDER";
                }else{
                    return QString::fromStdString(i.parts[dex].link);
                }
            }
        }
    }
    QString EngineMod::getPartCur(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                if (dex >= i.parts.size()) {
                    return "PLACEHOLDER";
                }else{
                    return QString::fromStdString(i.parts[dex].cur);
                }
            }
        }
    }
    QString EngineMod::getPartValue(int id, int dex, int dexs) {
        for (project& i: all_projects) {
            if (i.id == id) {
                if (dexs >= i.parts[dex].values.size()) {
                    return "PLACEHOLDER";
                }else{
                    return QString::fromStdString(i.parts[dex].values[dexs]);
                }
            }
        }
    }
    int EngineMod::getPartPrice(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                if (dex >= i.parts.size()) {
                    return 0;
                }else{
                    return i.parts[dex].price;
                }
            }
        }
    }

    int EngineMod::getPartSize(int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
               return i.parts.size();
            }
        }
    }
    int EngineMod::getPartVSize(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                if (dex >= i.parts.size()) {
                    return 0;
                }else{
                    return i.parts[dex].values.size();
                }
            }
        }
    }

    QString EngineMod::getPath(int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                return QString::fromStdString(i.path);
            }
        }
        return "NULL";
    }

    QString EngineMod::getTaskName(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                if (dex >= i.tasks.size()) {
                    return "PLACEHOLDER";
                }else{
                    return QString::fromStdString(i.tasks[dex].name);
                }
            }
        }
    }
    QString EngineMod::getSubTaskName(int id, int dex, int dexx) {
        for (project& i: all_projects) {
            if (i.id == id) {
                if (dexx >= i.tasks[dex].subtasks.size()) {
                    return "PLACEHOLDER";
                }else{
                    return QString::fromStdString(i.tasks[dex].subtasks[dexx].name);
                }
            }
        }
    }
    int EngineMod::getTaskSize(int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                return i.tasks.size();
            }
        }
    }
    int EngineMod::getSubTaskSize(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                if (dex >= i.tasks.size()) {
                    return 0;
                }else{
                    return i.tasks[dex].subtasks.size();
                }
            }
        }
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

        // cout << dir << "\n";
        // newProto->setParent(dir);
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

        // cout << dir << "\n";
        // newProto->setParent(dir);
        QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

        QQuickItem* par = qobject_cast<QQuickItem*>(dir);
        QQuickItem* child = qobject_cast<QQuickItem*>(newProto);

        child->setParentItem(par);
    }
    void EngineMod::addTask(task& tk, int& id, int& dex) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/task.qml")));
        // assign propertys
        QVariantMap protoProp;
        protoProp["name"] = QString::fromStdString(tk.name);
        protoProp["done"] = tk.done;
        protoProp["color"] = QString::fromStdString(color);
        protoProp["id"] = id;
        protoProp["dex"] = dex;

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active2.push_back(newProto);
        // add in to the qml
        QObject* dir = qqml["taskDir"];
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }

        // newProto->setParent(dir);
        QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

        QQuickItem* par = qobject_cast<QQuickItem*>(dir);
        QQuickItem* child = qobject_cast<QQuickItem*>(newProto);

        child->setParentItem(par);
        tk.dir = child;
    }
    void EngineMod::addSubTask(subtask& sub, task& par, int& id, int& dex, int& dexx) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/subTask.qml")));
        // assign propertys
        QVariantMap protoProp;
        protoProp["name"] = QString::fromStdString(sub.name);
        protoProp["done"] = sub.done;
        protoProp["color"] = QString::fromStdString(color);
        protoProp["id"] = id;
        protoProp["dex"] = dex;
        protoProp["dexx"] = dexx;

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active2.push_back(newProto);
        // add in to the qml
        QObject* dir = par.dir;
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }
        if (dir != nullptr) {
            // cout << dir << "\n";
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
        // cout << dir << "\n";
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
        protoProp["name"] = QString::fromStdString(" " + part.name);
        string cur = part.cur + to_string(part.price);
        protoProp["cur"] = QString::fromStdString(part.cur);
        protoProp["price"] = part.price;
        string des = part.link + "\n";
        for (string& i : part.values) {
            des += "* ";
            des += i + "\n";
        }
        protoProp["desc"] = QString::fromStdString(des);

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active2.push_back(newProto);
        // add in to the qml
        QObject* dir = qqml["partDir"];
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
    void EngineMod::addDir(string s, filesystem::path parent, project& proj) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/dir.qml")));
        // assign propertys
        QVariantMap protoProp;
        std::filesystem::path p(s);
        string name = p.filename().string();
        protoProp["color"] = QString::fromStdString(color);
        protoProp["name"] = QString::fromStdString(name);
        int i = 0;
        while (p.parent_path() != filesystem::path(proj.path)) {
            i++;
            p = p.parent_path();
        }
        protoProp["tab"] = i;

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active2.push_back(newProto);
        // add in to the qml
        QObject* dir;
        if (parent == filesystem::path(proj.path)) {
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

        fileMap[filesystem::path(s)] = child;
    }
    void EngineMod::addfile(string s, filesystem::path parent, project& proj) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/file.qml")));
        // assign propertys
        QVariantMap protoProp;
        std::filesystem::path p(s);
        string name = p.filename().string();
        protoProp["color"] = QString::fromStdString(color);
        protoProp["name"] = QString::fromStdString(name);
        int i = 0;
        while (p.parent_path() != filesystem::path(proj.path)) {
            i++;
            p = p.parent_path();
        }
        protoProp["tab"] = i;

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active2.push_back(newProto);
        // add in to the qml
        QObject* dir;
        if (parent == filesystem::path(proj.path)) {
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
    void EngineMod::addQTask(string s, int& id) {
        QQmlComponent component(eng, QUrl(QStringLiteral("qrc:/qt/qml/EngineMod/QML/homeTask.qml")));
        // assign propertys
        QVariantMap protoProp;
        protoProp["name"] = QString::fromStdString(s);
        protoProp["color"] = QString::fromStdString(color);
        protoProp["id"] = id;

        QObject* newProto = component.createWithInitialProperties(protoProp, eng->rootContext());
        active.push_back(newProto);
        // add in to the qml
        QObject* dir = qqml["homeDir"];
        if (!newProto) {
            qWarning() << "Failed to create:" << component.errors();
            return;
        }
        if (dir != nullptr) {
            // cout << dir << "\n";
            newProto->setParent(dir);
            QQmlEngine::setObjectOwnership(newProto, QQmlEngine::CppOwnership);

            QQuickItem* parn = qobject_cast<QQuickItem*>(dir);
            QQuickItem* child = qobject_cast<QQuickItem*>(newProto);

            child->setParentItem(parn);
        }
    }

    void EngineMod::checkers(int id, int dex, bool done) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                        i.tasks[dex].done = done;
                        data["task"][dex]["done"] = done;
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                selProj(id);
                break;
            }
        }
    }
    void EngineMod::subCheckers(int id, int dex, int dexx, bool done) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);

                    i.tasks[dex].subtasks[dexx].done = done;
                    data["task"][dex]["sub"][dexx]["done"] = done;

                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                break;
            }
        }
    }

    void EngineMod::addProj() {
        nlohmann::json data;
        ifstream pfile("EngineMod/JSON/DATA.json");
        if(pfile.is_open()) {
            data = nlohmann::json::parse(pfile);
            data["proj"].push_back({{"path", " "}});
            pfile.close();
        }else {
            cerr << "project file missing?: "<< "\n";
        }
        ofstream file("EngineMod/JSON/DATA.json");
        if (file.is_open()) {
            file << data.dump(4);
            file.close();
        }
        initDB();
        loadQML();
    }
    void EngineMod::addProto() {
        nlohmann::json data;
        ifstream pfile("EngineMod/JSON/DATA.json");
        if(pfile.is_open()) {
            data = nlohmann::json::parse(pfile);
            data["proto"].push_back({{"name", "placeholder"},{"des", "placeholder"}});
            pfile.close();
        }else {
            cerr << "project file missing?: "<< "\n";
        }
        ofstream file("EngineMod/JSON/DATA.json");
        if (file.is_open()) {
            file << data.dump(4);
            file.close();
        }
        initDB();
        loadQML();
    }
    void EngineMod::addHome(QString Qs) {
        nlohmann::json data;
        ifstream pfile("EngineMod/JSON/DATA.json");
        if(pfile.is_open()) {
            data = nlohmann::json::parse(pfile);
            data["home"].push_back(Qs.toStdString());
            pfile.close();
        }else {
            cerr << "project file missing?: "<< "\n";
        }
        ofstream file("EngineMod/JSON/DATA.json");
        if (file.is_open()) {
            file << data.dump(4);
            file.close();
        }
        initDB();
        loadQML();
    }

    void EngineMod::delProj(int id) {
        nlohmann::json data;
        ifstream pfile("EngineMod/JSON/DATA.json");
        if (pfile.is_open()) {
            data = nlohmann::json::parse(pfile);
            data["proj"].erase(id);
            pfile.close();
        }else {
            cerr << "project file missing?: "  << "\n";
        }
        ofstream file("EngineMod/JSON/DATA.json");
        if (file.is_open()) {
            file << data.dump(4);
            file.close();
        }
        initDB();
        loadQML();
    }
    void EngineMod::delProto(int id) {
        nlohmann::json data;
        ifstream pfile("EngineMod/JSON/DATA.json");
        if (pfile.is_open()) {
            cout << id << "\n";
            data = nlohmann::json::parse(pfile);
            data["proto"].erase(id);
            pfile.close();
        }else {
            cerr << "project file missing?: "  << "\n";
        }
        ofstream file("EngineMod/JSON/DATA.json");
        if (file.is_open()) {
            file << data.dump(4);
            file.close();
        }
        initDB();
        loadQML();
    }
    void EngineMod::delHome(int id) {
        nlohmann::json data;
        ifstream pfile("EngineMod/JSON/DATA.json");
        if(pfile.is_open()) {
            data = nlohmann::json::parse(pfile);
            data["home"].erase(id);
            pfile.close();
        }else {
            cerr << "project file missing?: "<< "\n";
        }
        ofstream file("EngineMod/JSON/DATA.json");
        if (file.is_open()) {
            file << data.dump(4);
            file.close();
        }
        initDB();
        loadQML();
    }
    void EngineMod::delFet(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    data["fet"].erase(dex);
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                initDB();
                loadQML();
                break;
            }
        }
    }
    void EngineMod::delLink(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    data["link"].erase(dex);
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                initDB();
                loadQML();
                break;
            }
        }
    }
    void EngineMod::delPart(int id, int dex) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    data["part"].erase(dex);
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                initDB();
                loadQML();
                break;
            }
        }
    }
    void EngineMod::delPartV(int id, int dex, int dexx) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    data["part"][dex]["value"].erase(dexx);
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                initDB();
                loadQML();
                break;
            }
        }
    }
    void EngineMod::delTask(int dex, int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    data["task"].erase(dex);
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                initDB();
                loadQML();
                break;
            }
        }
    }
    void EngineMod::delSubTask(int id, int dex, int dexx) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    data["task"][dex]["sub"].erase(dexx);
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                initDB();
                loadQML();
                break;
            }
        }
    }

    void EngineMod::dircheck(string s, project& proj){

        for (const auto& entry : std::filesystem::directory_iterator(s)) {

            std::filesystem::path p = entry.path();

            if (std::filesystem::is_directory(p)) {

                addDir(p.string(),p.parent_path(),proj);

                dircheck(p.string(),proj);

            } else if (std::filesystem::is_regular_file(p)) {

                addfile(p.string(), p.parent_path(), proj);
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
        qqml["projPSL"]->setProperty("id", proj.id);
        qqml["todoName"]->setProperty("text", QString::fromStdString(proj.name));
        qqml["projNotes"]->setProperty("note", QString::fromStdString(proj.notes));
        qqml["projNotes"]->setProperty("id", proj.id);

        qqml["projprojSL"]->setProperty("currentIndex", 0);
        qqml["projprojSL"]->setProperty("id", proj.id);

        qqml["image"]->setProperty("source" ,QString::fromStdString(proj.logo));

        for (int i = 0; i < proj.tasks.size(); i++) {
            addTask(proj.tasks[i], proj.id, i);
            for (int j = 0; j < proj.tasks[i].subtasks.size(); j++) {
                addSubTask(proj.tasks[i].subtasks[j],proj.tasks[i],proj.id,i,j);
            }
        }
        qqml["projTSL"]->setProperty("id", proj.id);
        for (pair<string, string>& i: proj.links ) {
            addlink(i);
        }
        qqml["projLSL"]->setProperty("id", proj.id);
        for (part& i : proj.parts) {
            addPart(i);
        }
        qqml["projF"]->setProperty("id", proj.id);

        filesystem::path p(proj.path);
        if (!proj.path.empty() && filesystem::is_directory(p)) {
            dircheck(proj.path, proj);
        }
    }
    void EngineMod::selProto(int id) {
        proto pro;
        for (proto& i: all_proto) {
            if (i.id == id) {
                pro = i;
                break;
            }
        }
        qqml["protoSL"]->setProperty("id", pro.id);
        qqml["protoRName"]->setProperty("text", QString::fromStdString(pro.name));
        qqml["protoRDes"]->setProperty("text", QString::fromStdString(pro.des));
        qqml["protoN"]->setProperty("text", QString::fromStdString(pro.name));
        qqml["protoD"]->setProperty("text", QString::fromStdString(pro.des));
    }

    void EngineMod::changeNotes(QString Qs, int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    i.notes = Qs.toStdString();

                    data["note"] = Qs.toStdString();
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                break;
            }
        }
    }
    void EngineMod::changePath(QString Qs, int id) {
        for (int i = 0; i < all_projects.size(); i++) {
            if (all_projects[i].id == id) {
                nlohmann::json data;
                ifstream pfile("EngineMod/JSON/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    all_projects[i].path = Qs.toStdString();

                    data["proj"][i]["path"] = Qs.toStdString();
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << all_projects[i].path << "\n";
                }

                ofstream file("EngineMod/JSON/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                break;
            }
        }
    }

    void EngineMod::changeDes(QString Qs, int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    i.des = Qs.toStdString();

                    data["des"] = Qs.toStdString();
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                break;
            }
        }
    }
    void EngineMod::changeLogo(QString Qs, int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    i.logo = Qs.toStdString();

                    data["logo"] = Qs.toStdString();
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                break;
            }
        }
    }
    void EngineMod::changeName(QString Qs, int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    i.name = Qs.toStdString();

                    data["Name"] = Qs.toStdString();
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                break;
                loadQML();
            }
        }
    }
    void EngineMod::changeFet(QString Qs, int dex, int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    if (dex >= i.features.size()) {
                        i.features.push_back(Qs.toStdString());

                        data["fet"].push_back(Qs.toStdString());
                    }else {
                        i.features[dex] = Qs.toStdString();

                        data["fet"][dex] = Qs.toStdString();
                    }
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                break;
            }
        }
    }

    void EngineMod::changeProto(QString name, QString des, int id) {
        for (proto& i: all_proto) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile("EngineMod/JSON/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);

                        i.des = name.toStdString();
                        i.des = des.toStdString();

                        data["proto"][id]["name"] = name.toStdString();
                        data["proto"][id]["des"] = des.toStdString();
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << "\n";
                }

                ofstream file("EngineMod/JSON/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                initDB();
                loadQML();
                break;
            }
        }
    }

    void EngineMod::changeLink(QString name, QString link, int dex, int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    if (dex >= i.links.size()) {
                        pair<string, string> temp;
                        temp.first = name.toStdString();
                        temp.second = link.toStdString();
                        i.links.push_back(temp);
                        data["link"].push_back({{"name","asd"}, {"link","asd"}});
                    }else {
                        i.links[dex].first = name.toStdString();
                        i.links[dex].second = link.toStdString();

                        data["link"][dex]["name"] = name.toStdString();
                        data["link"][dex]["link"] = link.toStdString();
                    }
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                selProj(id);
                break;
            }
        }
    }

    void EngineMod::changePart(QString name, QString link, QString cur, int price, int dex, int id) {
        for (project& i: all_projects) {
            if (i.id == id) {

                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    if (dex >= i.parts.size()) {
                        part temp;
                        temp.name = name.toStdString();
                        temp.link = link.toStdString();
                        temp.cur = cur.toStdString();
                        temp.price = price;
                        i.parts.push_back(temp);

                        data["part"].push_back({{"name",name.toStdString()},{"link",link.toStdString()},{"cur",cur.toStdString()},{"price",price},{"value",nlohmann::json::array()}});
                    }else {
                        i.parts[dex].name = name.toStdString();
                        i.parts[dex].link = link.toStdString();
                        i.parts[dex].cur = cur.toStdString();
                        i.parts[dex].price = price;

                        data["part"][dex]["name"] = name.toStdString();
                        data["part"][dex]["link"] = link.toStdString();
                        data["part"][dex]["cur"] = cur.toStdString();
                        data["part"][dex]["price"] = price;
                    }
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                selProj(id);
                break;
            }
        }
    }

    void EngineMod::changePartValue(QString name, int dex, int dexx, int id) {
        for (project& i: all_projects) {
            if (i.id == id) {

                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    if (dexx >= i.parts[dex].values.size()) {
                        i.parts[dex].values.push_back(name.toStdString());
                        data["part"][dex]["value"].push_back(name.toStdString());
                    }else {
                        i.parts[dex].values[dexx] = name.toStdString();
                        data["part"][dex]["value"][dexx] = name.toStdString();
                    }
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                break;
            }
        }
    }

    void EngineMod::changeTask(QString QS, int dex, int id) {
        for (project& i: all_projects) {
            if (i.id == id) {
                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    if (dex >= i.tasks.size()) {
                        task temp;
                        temp.name = QS.toStdString();
                        i.tasks.push_back(temp);

                        data["task"].push_back({{"name",QS.toStdString()},{"done",false},{"sub",nlohmann::json::array()}});
                    }else {
                        i.tasks[dex].name = QS.toStdString();

                        data["task"][dex]["name"] = QS.toStdString();
                    }
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                selProj(id);
                break;
            }
        }
    }
    void EngineMod::changeSubTask(QString Qs, int dex, int dexx, int id) {
        for (project& i: all_projects) {
            if (i.id == id) {


                nlohmann::json data;
                ifstream pfile(i.path + "/managerData/DATA.json");
                if(pfile.is_open()) {
                    data = nlohmann::json::parse(pfile);
                    if (dexx >= i.tasks[dex].subtasks.size()) {
                        subtask temp;
                        temp.name = Qs.toStdString();
                        temp.done = false;
                        i.tasks[dex].subtasks.push_back(temp);

                        data["task"][dex]["sub"].push_back({{"name",Qs.toStdString()},{"done",false}});
                    }else {
                        i.tasks[dex].subtasks[dexx].name = Qs.toStdString();

                        data["task"][dex]["sub"][dexx]["name"] = Qs.toStdString();
                    }
                    pfile.close();
                }else {
                    cerr << "project file missing?: " << i.path << "\n";
                }

                ofstream file(i.path + "/managerData/DATA.json");
                if (file.is_open()) {
                    file << data.dump(4);
                    file.close();
                }
                break;
            }
        }
    }
}


