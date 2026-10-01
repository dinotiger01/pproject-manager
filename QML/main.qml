import QtQuick
import QtQuick.Shapes
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import EngineMod

//fuck AI (personal opinon)

Window{
    property color back: "#00000000"
    property color hover: "#80" + engin.getColor()
    property color unactive: "#40" + engin.getColor()
    property color active: "#c0" + engin.getColor()
    property color clear: "#00" + engin.getColor()
    property color stadic: "#c0" + engin.getColor()
    id : root
    width: 1024
    height: 580
    visible: true
    title: "Project Manager"
    color: "#00000000"
    EngineMod{
        id: engin
        Component.onCompleted: {
            engin.setQML(potTabButtonCon, "protoDir")
            engin.setQML(projTabButtonCon, "projDir")

            engin.setQML(projprojSL, "projprojSL")
            engin.setQML(image, "image")
            //proto
            engin.setQML(listN, "protoRName")
            engin.setQML(listD, "protoRDes")

            engin.setQML(protoSL, "protoSL")
            engin.setQML(protoD, "protoD")
            engin.setQML(protoN, "protoN")
            // poject
            engin.setQML(projectRightName, "projRName")
            engin.setQML(projRFeatures, "projRfeture")
            // project detail
            //project task
            engin.setQML(projToDo, "taskDir")
            engin.setQML(todoName, "todoName")
            engin.setQML(projTSL, "projTSL")
            //project link
            engin.setQML(projLink, "projLink")
            engin.setQML(linkName, "linkName")
            engin.setQML(projLSL, "projLSL")
            // notes
            engin.setQML(projNotes, "projNotes")
            engin.setQML(noteName, "noteName")
            // part
            engin.setQML(partsName, "partName")
            engin.setQML(partDir, "partDir")
            engin.setQML(projPSL, "projPSL")
            //files
            engin.setQML(fileName, "fileName")
            engin.setQML(fileDir, "fileDir")
            engin.setQML(projF, "projF")
            // home
            engin.setQML(homeList, "homeDir")


            engin.setQML(root, "root")
        }
    }
    //top bar selector
    Column{
        anchors{fill: parent}
        Item {
            id: topBar
            width: parent.width
            height: 50
            Item{
                id: topBarContainer
                height: parent.height
                width : parent.width/2
                Row{
                    anchors.fill: parent
                    ButtonGroup{
                        id: mainButton
                    }
                    Repeater{
                        model: 4
                        anchors.fill: parent
                        Button{
                            required property int index
                            width: parent.width / 4
                            height: parent.height
                            checkable: true
                            checked: index === 0
                            onClicked: {
                                tabHolder.currentIndex = index
                                // engin.loadQML()
                            }
                            ButtonGroup.group: mainButton
                            background: Rectangle{
                                anchors{
                                    fill: parent
                                    margins: parent.down ? 1 :
                                        parent.hovered ? 2:
                                            parent.checked ? 3: 5
                                }
                                color: root.clear
                                radius: 15
                                border{
                                    width: 2
                                    color: parent.checked ? root.active :
                                           parent.hovered ? root.hover: root.unactive
                                }
                                Text{
                                    anchors{
                                        fill: parent
                                        // margins: 5
                                    }
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pointSize: parent.parent.down ? 23 :
                                        parent.parent.hovered ? 22 :
                                            parent.parent.checked ? 21 : 20
                                    text: index === 0 ? "Home" :
                                            index === 1 ? "Project" :
                                                index === 2 ? "List" :
                                                    index === 3 ? " Settings" : "Null"
                                    color: parent.parent.checked ? root.active :
                                            parent.parent.hovered ? root.hover: root.unactive
                                }
                            }
                        }
                    }
                }
                // TabBar{
                //     id: topBarRow
                //     background: Item{}
                //     spacing: 10
                //     anchors.centerIn: topBarContainer
                //     anchors.left : topBarContainer.left
                //     //home logo
                //     TabButton {
                //         id: home
                //         width:  down ? 120 :
                //                 hovered ? 110 :
                //                 checked ? 110 : 100
                //         height: down ? 50 :
                //                 hovered ? 45 :
                //                 checked ? 45 : 40
                //         hoverEnabled: true
                //         background: Rectangle{
                //             color: "light blue"
                //             radius : 15
                //             Text{
                //                 text: "home"
                //                 anchors.centerIn: parent
                //                 font.pointSize: home.down ? 26 :
                //                                 home.hovered ? 24 :
                //                                 home.checked ? 24 : 20
                //             }
                //         }
                //     }
                //     // projects
                //     TabButton{
                //         id: projs
                //         width:  down ? 140 :
                //                 hovered ? 130 :
                //                 checked ? 130 : 120
                //         height: down ? 50 :
                //                 hovered ? 45 :
                //                 checked ? 45 : 40
                //         background: Rectangle{
                //             color: "pink"
                //             radius : 15
                //             Text{
                //                 text: "projects"
                //                 anchors.centerIn: parent
                //                 font.pointSize: projs.down ? 26 :
                //                                 projs.hovered ? 24 :
                //                                 projs.checked ? 24 : 20
                //             }
                //         }
                //     }
                //     // list
                //     TabButton {
                //         id: list
                //         width:  down ? 120 :
                //                 hovered ? 110 :
                //                 checked ? 110 : 100
                //         height: down ? 50 :
                //                 hovered ? 45 :
                //                 checked ? 45 : 40
                //         background: Rectangle{
                //             color: "green"
                //             radius : 15
                //             Text{
                //                 text: "list"
                //                 anchors.centerIn: parent
                //                 font.pointSize: list.down ? 26 :
                //                                 list.hovered ? 24 :
                //                                 list.checked ? 24 : 20
                //             }
                //         }
                //     }
                //     // calender
                //     TabButton {
                //         id: cal
                //         width:  down ? 140 :
                //                 hovered ? 130 :
                //                 checked ? 130 : 120
                //         height: down ? 50 :
                //                 hovered ? 45 :
                //                 checked ? 45 : 40
                //         background: Rectangle {
                //             color: "purple"
                //             radius: 15
                //             Text {
                //                 text: "calender"
                //                 anchors.centerIn: parent
                //                 font.pointSize: cal.down ? 26 :
                //                                 cal.hovered ? 24 :
                //                                 cal.checked ? 24 : 20
                //             }
                //         }
                //     }
                // }
            }
        }
        Rectangle{
            width: parent.width
            height: 2
            color: root.stadic
        }
        StackLayout {
            id: tabHolder
            width: parent.width
            height: parent.height - topBarContainer.height - 2
            currentIndex: 0
            // home
            Row{
                id: homeTab
                width: parent.width
                height: parent.height
                // todo list today
                StackLayout{
                    id:homeSL
                    width: parent.width/2
                    height: parent.height
                    currentIndex: 0
                    Item{
                        height: parent.height
                        width: parent.width
                        ScrollView{
                            height: parent.height
                            width: parent.width
                            Column{
                                id: homeList
                                anchors{
                                    fill: parent
                                }
                            }
                        }
                        Row{
                            anchors{
                                right: parent.right
                                bottom: parent.bottom
                            }
                            height: 50
                            width: 250
                            TextArea{
                                id: homeTA
                                width: 0
                                height: 50
                                background: Rectangle{
                                    width: parent.width
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: root.stadic
                                    }
                                }
                                color: root.stadic
                                font.pointSize: 15
                                // verticalAlignment: Text.AlignVCenter
                                wrapMode: TextArea.WordWrap
                            }
                            CheckBox{
                                width: 50
                                height: 50
                                anchors{
                                    right: parent.right
                                    bottom: parent.bottom
                                }
                                indicator:Rectangle {
                                    anchors {
                                        fill: parent
                                        margins: parent.down ? 1 :
                                            parent.hovered ? 2 :
                                                parent.checked ? 3 : 5
                                    }
                                    color: root.clear
                                    radius: 15
                                    border {
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover : root.unactive
                                    }
                                }
                                onClicked:{
                                    if (homeTA.width === 0){
                                        homeTA.width = 200
                                        homeTA.text = "";
                                    }else{
                                        homeTA.width = 0
                                        engin.addHome(homeTA.text)
                                    }
                                }
                            }
                        }
                    }
                    Column{
                        width: parent.width
                        height: parent.height
                        Row{
                            ButtonGroup{id: watchBG}
                            width: 500
                            height: 50
                            x: 150
                            CheckBox{
                                height: 50
                                width: watchTT.implicitWidth + 15
                                ButtonGroup.group: watchBG
                                indicator: Rectangle{
                                    width: watchTT.implicitWidth + 10
                                    height: parent.height
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover: root.unactive
                                    }
                                    Text{
                                        anchors{fill:parent}
                                        id: watchTT
                                        text: "Timer"
                                        font.pointSize: 25
                                        horizontalAlignment: Text.AlignHCenter
                                        color: parent.parent.checked ? root.active :
                                            parent.parent.hovered ? root.hover: root.unactive
                                    }
                                }
                                onClicked:{
                                    if(watchCont.stops){
                                        watchCont.stops = false
                                        newTime.width = 150
                                        watchDis.text = "00:00:00"
                                        clockPR.checked = false
                                        clock.running = false
                                        timeRest.click()
                                        progressCircle.arcAngle = 0;
                                    }
                                }
                            }
                            CheckBox{
                                height: 50
                                width: watchST.implicitWidth + 15
                                ButtonGroup.group: watchBG
                                indicator: Rectangle{
                                    width: watchST.implicitWidth + 10
                                    height: parent.height
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover: root.unactive
                                    }
                                    Text{
                                        anchors{fill:parent}
                                        id: watchST
                                        text: "Stop-Watch"
                                        font.pointSize: 25
                                        horizontalAlignment: Text.AlignHCenter
                                        color: parent.parent.checked ? root.active :
                                            parent.parent.hovered ? root.hover: root.unactive
                                    }
                                }
                                onClicked:{
                                    if(!watchCont.stops){
                                        watchCont.stops = true
                                        newTime.width = 0

                                        watchDis.text = "00:00:00"
                                        clockPR.checked = false
                                        clock.running = false
                                        timeRest.click()
                                        progressCircle.arcAngle = 360;
                                    }
                                }
                            }
                        }
                        Item{
                            width: parent.width
                            height: parent.height - 100
                            Shape {
                                id: progressCircle
                                width: 400
                                height: 400
                                x: 50
                                layer.enabled: true
                                layer.samples: 4
                                Item{
                                    height: 50
                                    width: watchDis.implicitWidth
                                    y: progressCircle.height/ ((1/3) * 4) - height/2
                                    anchors{
                                        horizontalCenter: parent.horizontalCenter
                                    }
                                    Text{
                                        id: watchDis
                                        text: "00:00:00"
                                        font.pointSize: 25
                                        color: root.stadic
                                    }
                                }

                                property real strokeWidth: 10
                                property real arcAngle: 360
                                ShapePath {
                                    strokeColor: root.stadic
                                    strokeWidth: progressCircle.strokeWidth
                                    fillColor: "transparent"
                                    capStyle: ShapePath.RoundCap

                                    PathAngleArc {
                                        centerX: progressCircle.width / 2
                                        centerY: progressCircle.height/ ((1/3) * 4)
                                        radiusX: (progressCircle.width - progressCircle.strokeWidth) / 2
                                        radiusY: (progressCircle.height - progressCircle.strokeWidth) / 2

                                        startAngle: -90
                                        sweepAngle: progressCircle.arcAngle
                                    }
                                }
                                Timer {
                                    property int h
                                    property int m
                                    property int s
                                    property int inc
                                    id: clock
                                    interval: 1000
                                    running: false
                                    repeat: true
                                    onTriggered: {
                                        if(watchCont.stops){
                                            s++
                                            if(s > 59){
                                                s = 0
                                                m++
                                            }
                                            if(m > 59){
                                                m = 0
                                                h++
                                            }
                                            watchDis.text = h + ":" + m + ":" + s
                                        }else{
                                            s--
                                            if(s < 0){
                                                s = 59
                                                m--
                                            }
                                            if(m < 0){
                                                m = 59
                                                h--
                                            }
                                            watchDis.text = h + ":" + m + ":" + s
                                            progressCircle.arcAngle -= 360/inc;
                                            if(progressCircle >= 360){
                                                clockPR.checked = false
                                                clock.running = false
                                            }
                                        }

                                    }
                                }

                            }
                        }
                        Row{
                            property bool stops: false
                            id: watchCont
                            x: 150
                            height: 50
                            CheckBox{
                                id: clockPR
                                // run / pause
                                width: 50
                                height: 50
                                onClicked:{
                                    clock.running = checked
                                }
                                indicator: Rectangle{
                                    anchors{
                                        fill: parent
                                        margins: parent.down ? 1 :
                                            parent.hovered ? 2:
                                                parent.checked ? 3: 5
                                    }
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover: root.unactive
                                    }
                                }
                            }
                            Button{
                                id: timeRest
                                width: 50
                                height: 50
                                onClicked:{
                                    if(watchCont.stops){
                                        clock.h = 0
                                        clock.m = 0
                                        clock.s = 0
                                    }else{
                                        let h = parseInt(newTime.text[0]) * 10 + parseInt(newTime.text[1])
                                        let m = parseInt(newTime.text[3]) * 10 + parseInt(newTime.text[4])
                                        let s = parseInt(newTime.text[6]) * 10 + parseInt(newTime.text[7])

                                        clock.inc = (h*3600) + (m*60) + s
                                        clock.h = h
                                        clock.m = m
                                        clock.s = s
                                        progressCircle.arcAngle = 0
                                        clockPR.checked = false
                                        clock.running = false
                                    }
                                }
                                background: Rectangle{
                                    anchors{
                                        fill: parent
                                        margins: parent.down ? 1 :
                                            parent.hovered ? 2:
                                                parent.checked ? 3: 5
                                    }
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover: root.unactive
                                    }
                                }
                            }
                            TextArea{
                                id: newTime
                                width: 150
                                height: 50
                                text: "01:00:00"
                                background: Item{}
                                color: root.stadic
                                font.pointSize: 25
                            }
                        }
                    }
                }
                Column{
                    width: parent.width/ 2
                    height: parent.height
                    // date time
                    Item{
                        width: parent.width
                        height: 50
                        Row{
                            ButtonGroup{id: mainSL}
                            CheckBox{
                                height: 50
                                width: 50
                                ButtonGroup.group: mainSL
                                checked: true
                                indicator: Rectangle{
                                    width: parent.width
                                    height: parent.height
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover: root.unactive
                                    }
                                    Text{
                                        anchors{fill:parent}
                                        text: "L"
                                        font.pointSize: 25
                                        horizontalAlignment: Text.AlignHCenter
                                        color: parent.parent.checked ? root.active :
                                            parent.parent.hovered ? root.hover: root.unactive
                                    }
                                }
                                onClicked:{
                                    homeSL.currentIndex = 0;
                                }

                            }
                            CheckBox{
                                height: 50
                                width: 50
                                ButtonGroup.group: mainSL
                                indicator: Rectangle{
                                    width: parent.width
                                    height: parent.height
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover: root.unactive
                                    }
                                    Text{
                                        anchors{fill:parent}
                                        text: "T"
                                        font.pointSize: 25
                                        horizontalAlignment: Text.AlignHCenter
                                        color: parent.parent.checked ? root.active :
                                            parent.parent.hovered ? root.hover: root.unactive
                                    }
                                }
                                onClicked:{
                                    homeSL.currentIndex = 1;
                                }

                            }
                        }
                        //link to timeer becouse why not
                        Button{
                            implicitWidth: time.implicitWidth + 20
                            height: parent.height
                            anchors{right: parent.right}
                            background: Rectangle{
                                anchors{
                                    fill: parent
                                    margins: 5
                                }
                                color: root.clear
                                radius: 10
                                border{
                                    width: 2
                                    color: parent.checked ? root.active :
                                        parent.hovered ? root.hover: root.unactive
                                }
                                Text {
                                    id: time
                                    anchors{fill: parent}
                                    text: engin.gettime()
                                    font.pointSize: 20
                                    color: parent.parent.checked ? root.active :
                                        parent.parent.hovered ? root.hover: root.unactive
                                    horizontalAlignment: Text.AlignHCenter
                                }
                                Timer{
                                    interval: 1000
                                    running: true
                                    repeat: true
                                    onTriggered:{
                                        time.text = engin.gettime()
                                    }
                                }
                            }
                            onClicked:{
                                im.text = engin.gettime()
                                im.selectAll();
                                im.copy();
                            }
                            TextEdit{
                                id: im
                                visible: false
                            }
                        }
                    }
                    // hyper notes secttion
                    Rectangle{
                        width: parent.width
                        height: parent.height - 50
                        color: root.clear
                        Column{
                            anchors.fill: parent
                            Rectangle{
                                width: parent.width
                                height: 30
                                color: root.clear
                                Row{
                                    anchors.fill: parent
                                    Repeater{
                                        anchors.fill: parent
                                        model: 7
                                        Button{
                                            width: 30
                                            height: 30
                                            checkable: true
                                            background: Rectangle{
                                                color: root.clear
                                                radius: 5
                                                border{
                                                    width: 2
                                                    color: parent.checked ? root.active :
                                                        parent.hovered ? root.hover: root.unactive
                                                }
                                                anchors{
                                                    fill: parent
                                                    margins: parent.down ? 0 :
                                                        parent.checked ? 1 :
                                                            parent.hovered ? 2 : 3
                                                }
                                                Text{
                                                    anchors{fill: parent}
                                                    text: "I"
                                                    horizontalAlignment: Text.AlignHCenter
                                                    verticalAlignment: Text.AlignVCenter
                                                    fontSizeMode: Text.Fit
                                                    color: parent.parent.checked ? root.active :
                                                        parent.parent.hovered ? root.hover: root.unactive
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            TextArea{
                                width: parent.width
                                height: parent.height - 30
                                background: Item{}
                                color: root.active
                                font.pointSize: 15
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
            }
            // projects
            Row{
                id: projListCon
                width: parent.width
                height: parent.height
                // left project list
                Item{
                    id: projListsWrapper
                    width: parent.width / 2
                    height: parent.height
                    ScrollView{
                        id: projListScroll
                        anchors.fill: parent
                        clip: true
                        Column{
                            id: projTabButtonCon
                        }
                    }
                    Button{
                        width: 50
                        height: 50
                        anchors{
                            right: parent.right
                            bottom: parent.bottom
                        }
                        background:Rectangle {
                            anchors {
                                fill: parent
                                margins: parent.down ? 1 :
                                    parent.hovered ? 2 :
                                        parent.checked ? 3 : 5
                            }
                            color: root.clear
                            radius: 15
                            border {
                                width: 2
                                color: parent.checked ? root.active :
                                    parent.hovered ? root.hover : root.unactive
                            }
                        }
                        onClicked:{
                            engin.addProj();
                        }
                    }
                }
                // right project buttin
                Item{
                    width: parent.width / 2
                    height: parent.height
                    StackLayout{
                        id: projprojSL
                        property int id: -1
                        anchors{fill: parent}
                        currentIndex: 0
                        Item{
                            id: projProjTabHolder
                            anchors{fill:parent}
                            Column{
                                id: projDesTabWrapper
                                anchors{
                                    fill: parent
                                    margins: 15
                                }
                                spacing: 15
                                Rectangle{
                                    width: parent.width
                                    height: parent.height / 4 - 7.5
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: root.stadic
                                    }
                                    Row{
                                        width: parent.width - 10
                                        height: parent.height
                                        x: 10
                                        spacing: 10
                                        Rectangle{
                                            anchors{verticalCenter: parent.verticalCenter}
                                            width: parent.height - 20
                                            height: parent.height - 20
                                            color: root.clear
                                            radius: 15
                                            border{
                                                width: 2
                                                color: root.stadic
                                            }
                                            Image{
                                                anchors{fill:parent}
                                                id: image
                                            }
                                        }
                                        Text{
                                            id: projectRightName
                                            width: parent.width - parent.height - 10
                                            height: parent.height
                                            anchors{
                                                margins: 10
                                            }
                                            font.pointSize: 30
                                            wrapMode: Text.Wrap
                                            clip: true
                                            color: root.stadic
                                        }
                                    }
                                }
                                Item{
                                    width: parent.width
                                    height: parent.height * 0.75 - 7.5
                                    Row{
                                        spacing: 15
                                        anchors.fill: parent
                                        Rectangle{
                                            width: parent.width / 2.5
                                            height: parent.height
                                            color: root.clear
                                            radius: 15
                                            border{
                                                width: 2
                                                color: root.stadic
                                            }
                                            clip: true
                                            Column{
                                                anchors.fill: parent
                                                Repeater{
                                                    model: 6
                                                    // all project
                                                    Button{
                                                        required property int index
                                                        width: parent.width
                                                        height: parent.height / 6
                                                        onClicked: tabHolder.currentIndex = index + 4
                                                        background: Rectangle{
                                                            anchors{
                                                                fill: parent
                                                                margins: parent.hovered ?  8 : 10
                                                            }
                                                            color: root.clear
                                                            radius: 15
                                                            border{
                                                                width: 2
                                                                color: parent.checked ? root.active :
                                                                    parent.hovered ? root.hover: root.unactive
                                                            }
                                                            Text{
                                                                text: index === 0 ? "To-Do":
                                                                        index === 1 ? "Notes":
                                                                            index === 2 ? "Links":
                                                                                index === 3 ? "Parts":
                                                                                    index === 4 ? "Files":
                                                                                        index === 5 ? "Calender":""
                                                                anchors{
                                                                    horizontalCenter: parent.horizontalCenter
                                                                    verticalCenter: parent.verticalCenter
                                                                }
                                                                font.pointSize: parent.height - 15 > parent.width/ text.length ? parent.width/ text.length : parent.height - 15
                                                                color: parent.parent.checked ? root.active :
                                                                    parent.parent.hovered ? root.hover: root.unactive
                                                            }
                                                        }
                                                    }
                                                }
                                                // // to-do
                                                // Button{
                                                //     width: parent.width
                                                //     height: parent.height / 7
                                                //     background: Rectangle{
                                                //         anchors{
                                                //             fill: parent
                                                //             margins: 10
                                                //         }
                                                //         color: "light blue"
                                                //         radius: 15
                                                //         Text{
                                                //             text: "To-Do"
                                                //             anchors{
                                                //                 horizontalCenter: parent.horizontalCenter
                                                //                 verticalCenter: parent.verticalCenter
                                                //             }
                                                //             font.pointSize: parent.height - 15
                                                //         }
                                                //     }
                                                // }
                                                // // notes
                                                // Button{
                                                //     width: parent.width
                                                //     height: parent.height / 7
                                                //     background: Rectangle{
                                                //         anchors{
                                                //             fill: parent
                                                //             margins: 10
                                                //         }
                                                //         color: "light blue"
                                                //         radius: 15
                                                //         Text{
                                                //             text: "Notes"
                                                //             anchors{
                                                //                 horizontalCenter: parent.horizontalCenter
                                                //                 verticalCenter: parent.verticalCenter
                                                //             }
                                                //             font.pointSize: parent.height - 15
                                                //         }
                                                //     }
                                                // }
                                                // // quicklinks
                                                // Button{
                                                //     width: parent.width
                                                //     height: parent.height / 7
                                                //     background: Rectangle{
                                                //         anchors{
                                                //             fill: parent
                                                //             margins: 10
                                                //         }
                                                //         color: "light blue"
                                                //         radius: 15
                                                //         Text{
                                                //             text: "Links"
                                                //             anchors{
                                                //                 horizontalCenter: parent.horizontalCenter
                                                //                 verticalCenter: parent.verticalCenter
                                                //             }
                                                //             font.pointSize: parent.height - 15
                                                //         }
                                                //     }
                                                // }
                                                // // part-list
                                                // Button{
                                                //     width: parent.width
                                                //     height: parent.height / 7
                                                //     background: Rectangle{
                                                //         anchors{
                                                //             fill: parent
                                                //             margins: 10
                                                //         }
                                                //         color: "light blue"
                                                //         radius: 15
                                                //         Text{
                                                //             text: "Part List"
                                                //             anchors{
                                                //                 horizontalCenter: parent.horizontalCenter
                                                //                 verticalCenter: parent.verticalCenter
                                                //             }
                                                //             font.pointSize: parent.height - 15
                                                //         }
                                                //     }
                                                // }
                                                // // calender
                                                // Button{
                                                //     width: parent.width
                                                //     height: parent.height / 7
                                                //     background: Rectangle{
                                                //         anchors{
                                                //             fill: parent
                                                //             margins: 10
                                                //         }
                                                //         color: "light blue"
                                                //         radius: 15
                                                //         Text{
                                                //             text: "Calender"
                                                //             anchors{
                                                //                 horizontalCenter: parent.horizontalCenter
                                                //                 verticalCenter: parent.verticalCenter
                                                //             }
                                                //             font.pointSize: parent.height - 15
                                                //         }
                                                //     }
                                                // }
                                                // // files
                                                // Button{
                                                //     width: parent.width
                                                //     height: parent.height / 7
                                                //     background: Rectangle{
                                                //         anchors{
                                                //             fill: parent
                                                //             margins: 10
                                                //         }
                                                //         color: "light blue"
                                                //         radius: 15
                                                //         Text{
                                                //             text: "Files"
                                                //             anchors{
                                                //                 horizontalCenter: parent.horizontalCenter
                                                //                 verticalCenter: parent.verticalCenter
                                                //             }
                                                //             font.pointSize: parent.height - 15
                                                //         }
                                                //     }
                                                // }
                                            }
                                        }

                                        Rectangle{
                                            width: parent.width - parent.width / 2.5 - 15
                                            height: parent.height
                                            // anchors{
                                            //     right: parent.right
                                            // }
                                            color: root.clear
                                            radius: 15
                                            border{
                                                width: 2
                                                color: root.stadic
                                            }
                                            Text{
                                                // width: parent.width
                                                height: parent.height /10
                                                text: "featers"
                                                font.pointSize: 30
                                                anchors{
                                                    horizontalCenter: parent.horizontalCenter
                                                    margins: 10
                                                }
                                                color: root.stadic
                                            }
                                            Text{
                                                id: projRFeatures
                                                width: parent.width- 20
                                                height: parent.height * 9 / 10 - 30
                                                wrapMode: Text.WordWrap
                                                textFormat: Text.MarkdownText
                                                clip: true
                                                anchors{
                                                    bottom: parent.bottom
                                                    horizontalCenter: parent.horizontalCenter
                                                }
                                                color: root.stadic
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Item{
                            anchors{fill:parent}
                            Button{
                                width: 50
                                height: 50
                                anchors{
                                    right: parent.right
                                    verticalCenter: parent.verticalCenter
                                }
                                background:Rectangle {
                                    anchors {
                                        fill: parent
                                        margins: parent.down ? 1 :
                                            parent.hovered ? 2 :
                                                parent.checked ? 3 : 5
                                    }
                                    color: root.clear
                                    radius: 15
                                    border {
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover : root.unactive
                                    }
                                }
                                onClicked:{
                                    projprojR.model += 1
                                }
                            }
                            Column{
                                anchors{
                                    fill: parent
                                    margins: 15
                                }
                                DropArea{
                                    width: parent.width
                                    height: 50
                                    Rectangle{
                                        anchors{fill: parent}
                                        color: root.clear
                                        radius: 15
                                        border{
                                            width: 2
                                            color: root.stadic
                                        }
                                        Text{
                                            id: projprojL
                                            anchors{fill: parent}
                                            text: "drop area"
                                            color: root.stadic
                                            font.pointSize: 10
                                            verticalAlignment: Text.AlignVCenter
                                        }
                                    }
                                    onDropped: drop =>{
                                        projprojL.text = drop.urls.toString()
                                    }
                                }
                                TextArea{
                                    id: projprojN
                                    width: parent.width
                                    height: 50
                                    background: Rectangle{
                                        width: parent.width
                                        color: root.clear
                                        radius: 15
                                        border{
                                            width: 2
                                            color: root.stadic
                                        }
                                    }
                                    color: root.stadic
                                    font.pointSize: 25
                                    verticalAlignment: Text.AlignVCenter
                                    onTextChanged: {

                                    }
                                }
                                TextArea{
                                    id: projprojD
                                    width: parent.width
                                    height: 100
                                    background: Rectangle{
                                        width: parent.width
                                        color: root.clear
                                        radius: 15
                                        border{
                                            width: 2
                                            color: root.stadic
                                        }
                                    }
                                    color: root.stadic
                                    font.pointSize: 15
                                    // verticalAlignment: Text.AlignVCenter
                                    wrapMode: TextArea.WordWrap
                                    onTextChanged: {

                                    }
                                }
                                Repeater{
                                    id: projprojR
                                    model: 0
                                    TextArea{
                                        required property int index
                                        width: parent.width/1.5
                                        x: 15
                                        height: 40
                                        text: engin.getFet(projprojSL.id, index)
                                        background: Rectangle{
                                            width: parent.width
                                            color: root.clear
                                            radius: 15
                                            border{
                                                width: 2
                                                color: root.stadic
                                            }
                                        }
                                        color: root.stadic
                                        font.pointSize: 15
                                        verticalAlignment: Text.AlignVCenter
                                        Button{
                                            x: parent.width
                                            width: 40
                                            height: 40
                                            background:Rectangle {
                                                anchors {
                                                    fill: parent
                                                    margins: parent.down ? 1 :
                                                        parent.hovered ? 2 :
                                                            parent.checked ? 3 : 5
                                                }
                                                color: root.clear
                                                radius: 10
                                                border {
                                                    width: 2
                                                    color: parent.checked ? root.active :
                                                        parent.hovered ? root.hover : root.unactive
                                                }
                                            }
                                            onClicked:{
                                                engin.delFet(projprojSL.id, index)
                                            }
                                        }
                                        onTextChanged: {

                                        }
                                    }
                                }
                            }
                            Button{
                                width: 50
                                height: 50
                                anchors{
                                    right: parent.right
                                    top: parent.top
                                }
                                background:Rectangle {
                                    anchors {
                                        fill: parent
                                        margins: parent.down ? 1 :
                                            parent.hovered ? 2 :
                                                parent.checked ? 3 : 5
                                    }
                                    color: root.clear
                                    radius: 15
                                    border {
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover : root.unactive
                                    }
                                }
                                onClicked:{
                                    engin.delProj(projprojSL.id)
                                }
                            }
                        }
                    }
                    CheckBox{
                        width: 50
                        height: 50
                        anchors{
                            right: parent.right
                            bottom: parent.bottom
                        }
                        indicator:Rectangle{
                            anchors{
                                fill: parent
                                margins: parent.down ? 1 :
                                    parent.hovered ? 2:
                                        parent.checked ? 3: 5
                            }
                            color: root.clear
                            radius: 15
                            border{
                                width: 2
                                color: parent.checked ? root.active :
                                    parent.hovered ? root.hover: root.unactive
                            }
                        }
                        onClicked: {
                            if (projprojSL.currentIndex === 1) {
                                projprojSL.currentIndex = 0
                                //change stuff
                                engin.changeName(projprojN.text, projprojSL.id)
                                engin.changeDes(projprojD.text, projprojSL.id)
                                engin.changeLogo(projprojL.text, projprojSL.id)
                                for(let i = 0; i < projprojR.model; i++){
                                    engin.changeFet(projprojR.itemAt(i).text , i, projprojSL.id)
                                }
                                //load
                            } else {
                                projprojSL.currentIndex = 1
                                projprojN.text = engin.getName(projprojSL.id)
                                projprojD.text = engin.getDes(projprojSL.id)
                                projprojL.text = engin.getLogo(projprojSL.id)
                                projprojR.model = engin.getFetSize(projprojSL.id)
                            }
                        }
                    }
                }

            }
            // list
            Row{
                id: potListCon
                width: parent.width
                height: parent.height
                // left project list
                Item{
                    id: potListsWrapper
                    width: parent.width / 2
                    height: parent.height
                    ButtonGroup{
                        id: potListButtonGroup
                    }
                    ScrollView{
                        id: potListScroll
                        anchors.fill: parent
                        clip: true
                        Column{
                            id: potTabButtonCon
                            anchors.fill: parent
                        }
                    }
                    Button{
                        width: 50
                        height: 50
                        anchors{
                            right: parent.right
                            bottom: parent.bottom
                        }
                        background:Rectangle {
                            anchors {
                                fill: parent
                                margins: parent.down ? 1 :
                                    parent.hovered ? 2 :
                                        parent.checked ? 3 : 5
                            }
                            color: root.clear
                            radius: 15
                            border {
                                width: 2
                                color: parent.checked ? root.active :
                                    parent.hovered ? root.hover : root.unactive
                            }
                        }
                        onClicked:{
                            engin.addProto();
                        }
                    }
                }
                // right project descripsoin
                Item{
                    width: parent.width / 2
                    height: parent.height
                    StackLayout{
                        anchors{fill:parent}
                        id: protoSL
                        property int id: -1
                        currentIndex: 0
                        Item{
                            id: potProjTabHolder
                            Column{
                                id: potProjTabWrapper
                                anchors{fill: parent}
                                anchors{
                                    fill: parent
                                    margins: 15
                                }
                                spacing: 15
                                Rectangle{
                                    width: parent.width
                                    height: parent.height / 4 - 7.5
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: root.stadic
                                    }
                                    Text{
                                        id: listN
                                        anchors{
                                            fill: parent
                                            margins: 10
                                        }
                                        text: "Null"
                                        font.pointSize: 20
                                        wrapMode: Text.Wrap
                                        clip: true
                                        color: root.stadic
                                    }
                                }
                                Rectangle{
                                    width: parent.width
                                    height: parent.height * 0.75 - 7.5
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: root.stadic
                                    }
                                    clip: true
                                    Text{
                                        id: listD
                                        anchors{
                                            fill: parent
                                            margins: 10
                                        }
                                        text: "null"
                                        wrapMode: Text.Wrap
                                        clip: true
                                        color: root.stadic
                                    }
                                }
                            }
                        }
                        Item{
                            anchors{fill:parent}
                            Column{
                                anchors{
                                    fill: parent
                                    margins: 15
                                }
                                TextArea{
                                    id: protoN
                                    width: parent.width
                                    height: 50
                                    background: Rectangle{
                                        width: parent.width
                                        color: root.clear
                                        radius: 15
                                        border{
                                            width: 2
                                            color: root.stadic
                                        }
                                    }
                                    color: root.stadic
                                    font.pointSize: 25
                                    verticalAlignment: Text.AlignVCenter
                                    onTextChanged: {

                                    }
                                }
                                TextArea{
                                    id: protoD
                                    width: parent.width
                                    height: 300
                                    background: Rectangle{
                                        width: parent.width
                                        color: root.clear
                                        radius: 15
                                        border{
                                            width: 2
                                            color: root.stadic
                                        }
                                    }
                                    color: root.stadic
                                    font.pointSize: 15
                                    // verticalAlignment: Text.AlignVCenter
                                    wrapMode: TextArea.WrapAtWordBoundaryOrAnywhere
                                    onTextChanged: {

                                    }
                                }
                            }
                            Button{
                                width: 50
                                height: 50
                                anchors{
                                    right: parent.right
                                    top: parent.top
                                }
                                background:Rectangle {
                                    anchors {
                                        fill: parent
                                        margins: parent.down ? 1 :
                                            parent.hovered ? 2 :
                                                parent.checked ? 3 : 5
                                    }
                                    color: root.clear
                                    radius: 15
                                    border {
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover : root.unactive
                                    }
                                }
                                onClicked:{
                                    engin.delProto(protoSL.id)
                                }
                            }
                        }
                    }
                    CheckBox{
                        width: 50
                        height: 50
                        anchors{
                            right: parent.right
                            bottom: parent.bottom
                        }
                        indicator:Rectangle {
                            anchors {
                                fill: parent
                                margins: parent.down ? 1 :
                                    parent.hovered ? 2 :
                                        parent.checked ? 3 : 5
                            }
                            color: root.clear
                            radius: 15
                            border {
                                width: 2
                                color: parent.checked ? root.active :
                                    parent.hovered ? root.hover : root.unactive
                            }
                        }
                        onClicked:{
                            if(protoSL.currentIndex === 0){
                                protoSL.currentIndex = 1
                            }else{
                                protoSL.currentIndex = 0
                                engin.changeProto(protoN.text, protoD.text, protoSL.id)
                            }

                        }
                    }
                }
            }
            //stopwatch/ timer
            Item {
                id: stopwatchTab
                width: parent.width
                height: parent.height
                Column{
                    width: parent.width
                    height: parent.height
                    TextArea{
                        id: colorTA
                        width: 100
                        height: 50
                        background: Rectangle {
                            anchors {
                                fill: parent
                                margins: 5
                            }
                            color: root.clear
                            radius: 15
                            border {
                                width: 2
                                color: root.stadic
                            }
                        }
                        color: root.active
                        font.pointSize: 15
                        wrapMode: Text.Wrap
                        text: engin.getColor()
                    }
                    Button{
                        width: 50
                        height: 50
                        anchors{right: parent.right}
                        background: Rectangle{
                            anchors{
                                fill: parent
                                margins: 5
                            }
                            color: root.clear
                            radius: 10
                            border{
                                width: 2
                                color: parent.checked ? root.active :
                                    parent.hovered ? root.hover: root.unactive
                            }
                        }
                        onClicked:{
                            engin.changeColor(colorTA.text)
                        }
                    }

                }
                /*Column{
                    width: parent.width
                    height: parent.height
                    Row{
                        ButtonGroup{id: watchBG}
                        width: 500
                        height: 50
                        x: 150
                        CheckBox{
                            height: 50
                            width: watchTT.implicitWidth + 15
                            ButtonGroup.group: watchBG
                            indicator: Rectangle{
                                width: watchTT.implicitWidth + 10
                                height: parent.height
                                color: root.clear
                                radius: 15
                                border{
                                    width: 2
                                    color: parent.checked ? root.active :
                                        parent.hovered ? root.hover: root.unactive
                                }
                                Text{
                                    anchors{fill:parent}
                                    id: watchTT
                                    text: "Timer"
                                    font.pointSize: 25
                                    horizontalAlignment: Text.AlignHCenter
                                    color: parent.parent.checked ? root.active :
                                        parent.parent.hovered ? root.hover: root.unactive
                                }
                            }
                            onClicked:{
                                if(watchCont.stops){
                                    watchCont.stops = false
                                    newTime.width = 150
                                    watchDis.text = "00:00:00"
                                    clockPR.checked = false
                                    clock.running = false
                                    timeRest.click()
                                    progressCircle.arcAngle = 0;
                                }
                            }
                        }
                        CheckBox{
                            height: 50
                            width: watchST.implicitWidth + 15
                            ButtonGroup.group: watchBG
                            indicator: Rectangle{
                                width: watchST.implicitWidth + 10
                                height: parent.height
                                color: root.clear
                                radius: 15
                                border{
                                    width: 2
                                    color: parent.checked ? root.active :
                                        parent.hovered ? root.hover: root.unactive
                                }
                                Text{
                                    anchors{fill:parent}
                                    id: watchST
                                    text: "Stop-Watch"
                                    font.pointSize: 25
                                    horizontalAlignment: Text.AlignHCenter
                                    color: parent.parent.checked ? root.active :
                                        parent.parent.hovered ? root.hover: root.unactive
                                }
                            }
                            onClicked:{
                                if(!watchCont.stops){
                                    watchCont.stops = true
                                    newTime.width = 0

                                    watchDis.text = "00:00:00"
                                    clockPR.checked = false
                                    clock.running = false
                                    timeRest.click()
                                    progressCircle.arcAngle = 360;
                                }
                            }
                        }
                    }
                    Item{
                        width: parent.width
                        height: parent.height - 100
                        Shape {
                            id: progressCircle
                            width: 400
                            height: 400
                            x: 50
                            layer.enabled: true
                            layer.samples: 4
                            Item{
                                height: 50
                                width: watchDis.implicitWidth
                                y: progressCircle.height/ ((1/3) * 4) - height/2
                                anchors{
                                    horizontalCenter: parent.horizontalCenter
                                }
                                Text{
                                    id: watchDis
                                    text: "00:00:00"
                                    font.pointSize: 25
                                    color: root.stadic
                                }
                            }

                            property real strokeWidth: 10
                            property real arcAngle: 360
                            ShapePath {
                                strokeColor: root.stadic
                                strokeWidth: progressCircle.strokeWidth
                                fillColor: "transparent"
                                capStyle: ShapePath.RoundCap

                                PathAngleArc {
                                    centerX: progressCircle.width / 2
                                    centerY: progressCircle.height/ ((1/3) * 4)
                                    radiusX: (progressCircle.width - progressCircle.strokeWidth) / 2
                                    radiusY: (progressCircle.height - progressCircle.strokeWidth) / 2

                                    startAngle: -90
                                    sweepAngle: progressCircle.arcAngle
                                }
                            }
                            Timer {
                                property int h
                                property int m
                                property int s
                                property int inc
                                id: clock
                                interval: 1000
                                running: false
                                repeat: true
                                onTriggered: {
                                    if(watchCont.stops){
                                        s++
                                        if(s > 59){
                                            s = 0
                                            m++
                                        }
                                        if(m > 59){
                                            m = 0
                                            h++
                                        }
                                        watchDis.text = h + ":" + m + ":" + s
                                    }else{
                                        s--
                                        if(s < 0){
                                            s = 59
                                            m--
                                        }
                                        if(m < 0){
                                            m = 59
                                            h--
                                        }
                                        watchDis.text = h + ":" + m + ":" + s
                                        progressCircle.arcAngle -= 360/inc;
                                        if(progressCircle >= 360){
                                            clockPR.checked = false
                                            clock.running = false
                                        }
                                    }

                                }
                            }

                        }
                    }
                    Row{
                        property bool stops: false
                        id: watchCont
                        x: 150
                        height: 50
                        CheckBox{
                            id: clockPR
                            // run / pause
                            width: 50
                            height: 50
                            onClicked:{
                                clock.running = checked
                            }
                            indicator: Rectangle{
                                anchors{
                                    fill: parent
                                    margins: parent.down ? 1 :
                                        parent.hovered ? 2:
                                            parent.checked ? 3: 5
                                }
                                color: root.clear
                                radius: 15
                                border{
                                    width: 2
                                    color: parent.checked ? root.active :
                                        parent.hovered ? root.hover: root.unactive
                                }
                            }
                        }
                        Button{
                            id: timeRest
                            width: 50
                            height: 50
                            onClicked:{
                                if(watchCont.stops){
                                    clock.h = 0
                                    clock.m = 0
                                    clock.s = 0
                                }else{
                                    let h = parseInt(newTime.text[0]) * 10 + parseInt(newTime.text[1])
                                    let m = parseInt(newTime.text[3]) * 10 + parseInt(newTime.text[4])
                                    let s = parseInt(newTime.text[6]) * 10 + parseInt(newTime.text[7])

                                    let all = (h*3600) + (m*60) + s
                                    clock.inc = all
                                    clock.h = h
                                    clock.m = m
                                    clock.s = s
                                    progressCircle.arcAngle = 0
                                    clockPR.checked = false
                                    clock.running = false
                                }
                            }
                            background: Rectangle{
                                anchors{
                                    fill: parent
                                    margins: parent.down ? 1 :
                                        parent.hovered ? 2:
                                            parent.checked ? 3: 5
                                }
                                color: root.clear
                                radius: 15
                                border{
                                    width: 2
                                    color: parent.checked ? root.active :
                                        parent.hovered ? root.hover: root.unactive
                                }
                            }
                        }
                        TextArea{
                            id: newTime
                            width: 150
                            height: 50
                            text: "01:00:00"
                            background: Item{}
                            color: root.stadic
                            font.pointSize: 25
                        }
                    }
                }*/
            }
            // todo
            Item {
                width: parent.width
                height: parent.height
                CheckBox{
                    width: 50
                    height: 50
                    anchors{
                        right: parent.right
                        top: parent.top
                    }
                    indicator:Rectangle{
                        anchors{
                            fill: parent
                            margins: parent.down ? 1 :
                                parent.hovered ? 2:
                                    parent.checked ? 3: 5
                        }
                        color: root.clear
                        radius: 15
                        border{
                            width: 2
                            color: parent.checked ? root.active :
                                parent.hovered ? root.hover: root.unactive
                        }
                    }
                    onClicked: {
                        if (projTSL.currentIndex === 1) {
                            projTSL.currentIndex = 0
                            for(let i = 0; i < projTRP.model; i++){
                                let perRP = projTRP.itemAt(i);
                                engin.changeTask(perRP.name, i, projTSL.id)

                                for(var j = 1; j < perRP.size+1; j++ ){
                                    engin.changeSubTask(perRP.children[j].val, i, j-1, projTSL.id);
                                }
                            }
                        } else {
                            projTSL.currentIndex = 1
                            projTRP.model = 0
                            projTRP.model = engin.getTaskSize(projTSL.id)
                        }
                    }
                }
                Column{
                    width: parent.width
                    height: parent.height-2
                    y: 2
                    // name/logo
                    Row{
                        width: parent.width- 5
                        height: 50
                        x: 5
                        spacing: 5
                        Rectangle{
                            width: parent.height
                            height: parent.height
                            color: root.clear
                            radius: 15
                            border{
                                width: 2
                                color: root.stadic
                            }
                        }
                        Item{
                            width: parent.width - parent.height - 10
                            height: parent.height
                            clip: true
                            Text{
                                id: todoName
                                anchors{fill: parent}
                                text: "Null"
                                font.pointSize: parent.height / 2
                                color: root.stadic
                            }
                        }
                    }
                    // full list
                    StackLayout{
                        id: projTSL
                        property int id: -1
                        width: parent.width
                        height: parent.height -50
                        currentIndex: 0
                        ScrollView{
                            width: parent.width
                            height: parent.height
                            Column{
                                id: projToDo
                                anchors{fill: parent}

                            }
                        }
                        Item{
                            anchors{fill: parent}
                            ScrollView{
                                anchors{fill:parent}
                                Column{
                                    // id:
                                    spacing: 10
                                    anchors{fill: parent}
                                    Repeater{
                                        id: projTRP
                                        model: 0
                                        Column{
                                            width: parent.width
                                            property string pardex: index
                                            property string name: engin.getTaskName(projTSL.id, index)
                                            property int size: engin.getSubTaskSize(projTSL.id, index)
                                            Row{
                                                width: parent.width
                                                height: 50
                                                TextArea{
                                                    // width: parent.width/4
                                                    height: parent.height
                                                    text: name
                                                    background: Rectangle{
                                                        width: parent.width
                                                        color: root.clear
                                                        radius: 15
                                                        border{
                                                            width: 2
                                                            color: root.stadic
                                                        }
                                                    }
                                                    color: root.stadic
                                                    font.pointSize: 25
                                                    verticalAlignment: Text.AlignVCenter
                                                    onTextChanged: {
                                                        name = text
                                                    }
                                                }
                                                Button{
                                                    width: 50
                                                    height: 50
                                                    background:Rectangle{
                                                        anchors{
                                                            fill: parent
                                                            margins: parent.down ? 1 :
                                                                parent.hovered ? 2:
                                                                    parent.checked ? 3: 5
                                                        }
                                                        color: root.clear
                                                        radius: 15
                                                        border{
                                                            width: 2
                                                            color: parent.checked ? root.active :
                                                                parent.hovered ? root.hover: root.unactive
                                                        }
                                                    }
                                                    onClicked: {
                                                        size += 1
                                                    }
                                                }
                                                Button{
                                                    width: 50
                                                    height: 50
                                                    background:Rectangle{
                                                        anchors{
                                                            fill: parent
                                                            margins: parent.down ? 1 :
                                                                parent.hovered ? 2:
                                                                    parent.checked ? 3: 5
                                                        }
                                                        color: root.clear
                                                        radius: 15
                                                        border{
                                                            width: 2
                                                            color: parent.checked ? root.active :
                                                                parent.hovered ? root.hover: root.unactive
                                                        }
                                                    }
                                                    onClicked: {
                                                        engin.delTask(pardex, projTSL.id)
                                                        projTRP.model = engin.getTaskSize(projTSL.id)
                                                        // parent.parent.destroy(1000)
                                                    }
                                                }
                                            }
                                            Repeater{
                                                model: size
                                                Row{
                                                    x: 25
                                                    property string val:  engin.getSubTaskName(projTSL.id, pardex ,index)
                                                    TextArea{
                                                        // width: parent.width/2
                                                        height: 40

                                                        text: val
                                                        background: Rectangle {
                                                            // width: parent.width
                                                            height: parent.height
                                                            color: root.clear
                                                            radius: 15
                                                            border {
                                                                width: 2
                                                                color: root.stadic
                                                            }
                                                        }
                                                        color: root.stadic
                                                        font.pointSize: 20
                                                        verticalAlignment: Text.AlignVCenter
                                                        onTextChanged: {
                                                            val = text
                                                        }
                                                    }
                                                    Button{
                                                        width: 40
                                                        height: 40
                                                        background:Rectangle{
                                                            anchors{
                                                                fill: parent
                                                                margins: parent.down ? 1 :
                                                                    parent.hovered ? 2:
                                                                        parent.checked ? 3: 5
                                                            }
                                                            color: root.clear
                                                            radius: 15
                                                            border{
                                                                width: 2
                                                                color: parent.checked ? root.active :
                                                                    parent.hovered ? root.hover: root.unactive
                                                            }
                                                        }
                                                        onClicked: {
                                                            engin.delSubTask(projTSL.id, pardex, index)
                                                            size = engin.getSubTaskSize(projTSL.id, pardex)
                                                            // parent.parent.destroy(1000)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Button{
                                width: 50
                                height: 50
                                // checked: true
                                anchors{
                                    right: parent.right
                                    bottom: parent.bottom
                                }
                                background:Rectangle{
                                    anchors{
                                        fill: parent
                                        margins: parent.down ? 1 :
                                            parent.hovered ? 2:
                                                parent.checked ? 3: 5
                                    }
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover: root.unactive
                                    }
                                }
                                onClicked: {
                                    projTRP.model += 1
                                    // checked = true
                                }
                            }
                        }
                    }

                }
            }
            // notes
            Item {
                width: parent.width
                height: parent.height
                CheckBox{
                    width: 50
                    height: 50
                    anchors{
                        right: parent.right
                        top: parent.top
                    }
                    indicator:Rectangle{
                        anchors{
                            fill: parent
                            margins: parent.down ? 1 :
                                parent.hovered ? 2:
                                    parent.checked ? 3: 5
                        }
                        color: root.clear
                        radius: 15
                        border{
                            width: 2
                            color: parent.checked ? root.active :
                                parent.hovered ? root.hover: root.unactive
                        }
                    }
                    onClicked: {
                        if (projNSL.currentIndex === 1) {
                            projNSL.currentIndex = 0
                        } else {
                            projNSL.currentIndex = 1
                            projNotes.note = projNTA.text
                            engin.changeNotes(projNotes.note, projNotes.id)
                        }
                    }
                }
                Column{
                    width: parent.width
                    height: parent.height-2
                    y: 2
                    // name/logo
                    Row{
                        width: parent.width- 5
                        height: 50
                        x: 5
                        spacing: 5
                        Rectangle{
                            width: parent.height
                            height: parent.height
                            color: root.clear
                            radius: 15
                            border{
                                width: 2
                                color: root.stadic
                            }
                        }
                        Item{
                            width: parent.width - parent.height - 10
                            height: parent.height
                            clip: true
                            Text{
                                id: noteName
                                anchors{fill: parent}
                                text: "Null"
                                font.pointSize: parent.height / 2
                                color: root.stadic
                            }
                        }
                    }
                    // full list
                    ScrollView{
                        id: projNotes
                        property string note: "null"
                        property int id: -1
                        width: parent.width
                        height: parent.height-50
                        StackLayout{
                            id: projNSL
                            width: projNotes.width
                            height: parent.height
                            currentIndex: 1
                            TextArea{
                                id: projNTA
                                Layout.fillWidth: true
                                background: Rectangle{
                                    width: 1024
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: root.stadic
                                    }
                                }
                                text: projNotes.note
                                color: root.stadic
                            }
                            Text{
                                Layout.fillWidth: true
                                font.pointSize: 20
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                text: projNotes.note
                                textFormat: Text.MarkdownText
                                color: root.stadic
                            }
                        }
                    }
                }
            }
            // links
            Item {
                width: parent.width
                height: parent.height
                CheckBox{
                    width: 50
                    height: 50
                    anchors{
                        right: parent.right
                        top: parent.top
                    }
                    indicator:Rectangle{
                        anchors{
                            fill: parent
                            margins: parent.down ? 1 :
                                parent.hovered ? 2:
                                    parent.checked ? 3: 5
                        }
                        color: root.clear
                        radius: 15
                        border{
                            width: 2
                            color: parent.checked ? root.active :
                                parent.hovered ? root.hover: root.unactive
                        }
                    }
                    onClicked: {
                        if (projLSL.currentIndex === 1) {
                            projLSL.currentIndex = 0
                            for(var i = 0; i < projLRP.model; i++){
                                engin.changeLink(projLRP.itemAt(i).name, projLRP.itemAt(i).link, i, projLSL.id)
                            }
                        } else {
                            projLSL.currentIndex = 1
                            projLRP.model =  0
                            projLRP.model =  engin.getLinkSize(projLSL.id)
                        }
                    }
                }
                Column{
                    width: parent.width
                    height: parent.height-2
                    y: 2
                    // name/logo
                    Row{
                        width: parent.width- 5
                        height: 50
                        x: 5
                        spacing: 5
                        Rectangle{
                            width: parent.height
                            height: parent.height
                            color: root.clear
                            radius: 15
                            border{
                                width: 2
                                color: root.stadic
                            }
                        }
                        Item{
                            width: parent.width - parent.height - 10
                            height: parent.height
                            clip: true
                            Text{
                                id: linkName
                                anchors{fill: parent}
                                text: "Null"
                                font.pointSize: parent.height / 2
                                color: root.stadic
                            }
                        }
                    }
                    // full list
                    StackLayout{
                        id: projLSL
                        property int id: -1
                        width: parent.width
                        height: parent.height -50
                        currentIndex: 0
                        ScrollView{
                            anchors{fill:parent}
                            Column{
                                id: projLink
                                anchors{fill: parent}
                            }
                        }
                        Item{
                            anchors{fill: parent}
                            ScrollView{
                                anchors{fill:parent}
                                Column{
                                    // id:
                                    anchors{fill: parent}
                                    Repeater{
                                        id: projLRP
                                        model: 0
                                        Item{
                                            width: parent.width
                                            height: 50
                                            property string name: engin.getLinkName(projLSL.id, index)
                                            property string link: engin.getLinkLink(projLSL.id, index)
                                            Row{
                                                anchors{fill: parent}
                                                TextArea{
                                                    width: parent.width/2
                                                    height: parent.height
                                                    text: name
                                                    background: Rectangle{
                                                        width: parent.width
                                                        color: root.clear
                                                        radius: 15
                                                        border{
                                                            width: 2
                                                            color: root.stadic
                                                        }
                                                    }
                                                    color: root.stadic
                                                    onTextChanged: {
                                                        name = text
                                                    }
                                                }
                                                TextArea{
                                                    width: parent.width/3
                                                    height: parent.height
                                                    text: link
                                                    background: Rectangle{
                                                        width: parent.width
                                                        color: root.clear
                                                        radius: 15
                                                        border{
                                                            width: 2
                                                            color: root.stadic
                                                        }
                                                    }
                                                    color: root.stadic
                                                    onTextChanged: {
                                                        link = text
                                                    }
                                                }
                                                Button{
                                                    width: 50
                                                    height: 50
                                                    background:Rectangle {
                                                        anchors {
                                                            fill: parent
                                                            margins: parent.down ? 1 :
                                                                parent.hovered ? 2 :
                                                                    parent.checked ? 3 : 5
                                                        }
                                                        color: root.clear
                                                        radius: 15
                                                        border {
                                                            width: 2
                                                            color: parent.checked ? root.active :
                                                                parent.hovered ? root.hover : root.unactive
                                                        }
                                                    }
                                                    onClicked:{
                                                        engin.delLink(projLSL.id, index)
                                                        projLRP.model = engin.getLinkSize(projLSL.id)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Button{
                                width: 50
                                height: 50
                                anchors{
                                    right: parent.right
                                    bottom: parent.bottom
                                }
                                background:Rectangle{
                                    anchors{
                                        fill: parent
                                        margins: parent.down ? 1 :
                                            parent.hovered ? 2:
                                                parent.checked ? 3: 5
                                    }
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover: root.unactive
                                    }
                                }
                                onClicked: {
                                    projLRP.model += 1
                                }
                            }
                        }
                    }
                }
            }
            // parts
            Item {
                width: parent.width
                height: parent.height
                CheckBox{
                    width: 50
                    height: 50
                    anchors{
                        right: parent.right
                        top: parent.top
                    }
                    indicator:Rectangle{
                        anchors{
                            fill: parent
                            margins: parent.down ? 1 :
                                parent.hovered ? 2:
                                    parent.checked ? 3: 5
                        }
                        color: root.clear
                        radius: 15
                        border{
                            width: 2
                            color: parent.checked ? root.active :
                                parent.hovered ? root.hover: root.unactive
                        }
                    }
                    onClicked: {
                        if (projPSL.currentIndex === 1) {
                            projPSL.currentIndex = 0
                            for(let i = 0; i < projPRP.model; i++){
                                let parPart = projPRP.itemAt(i)
                                engin.changePart(parPart.name, parPart.link, parPart.cur, parPart.price, i, projPSL.id)

                                for(var j = 1; j < parPart.size+1; j++ ){
                                    engin.changePartValue(parPart.children[j].val, i, j-1, projPSL.id);
                                }
                            }
                        } else {
                            projPSL.currentIndex = 1
                            projPRP.model = 0
                            projPRP.model = engin.getPartSize(projPSL.id)
                        }
                    }
                }

                Column{
                    width: parent.width
                    height: parent.height-2
                    y: 2
                    // name/logo
                    Row{
                        width: parent.width- 5
                        height: 50
                        x: 5
                        spacing: 5
                        Rectangle{
                            width: parent.height
                            height: parent.height
                            color: root.clear
                            radius: 15
                            border{
                                width: 2
                                color: root.stadic
                            }
                        }
                        Item{
                            width: parent.width - parent.height - 10
                            height: parent.height
                            clip: true
                            Text{
                                id: partsName
                                anchors{fill: parent}
                                text: "Null"
                                font.pointSize: parent.height / 2
                                color: root.stadic
                            }
                        }
                    }
                    // full list
                    StackLayout{
                        id: projPSL
                        property int id: -1
                        width: parent.width
                        height: parent.height -50
                        currentIndex: 0
                        ScrollView{
                            width: parent.width
                            height: parent.height-50
                            Column{
                                id: partDir
                                anchors{fill: parent}
                            }
                        }
                        Item{
                            anchors{fill: parent}
                            ScrollView{
                                anchors{fill:parent}
                                Column{
                                    // id:
                                    spacing: 10
                                    anchors{fill: parent}
                                    Repeater{
                                        id: projPRP
                                        model: 0
                                        Column{
                                            width: parent.width
                                            // height: 50
                                            property int pardex: index
                                            property string name: engin.getPartName(projPSL.id, pardex)
                                            property string link: engin.getPartLink(projPSL.id, pardex)
                                            property string cur: engin.getPartCur(projPSL.id, pardex)
                                            property int price: engin.getPartPrice(projPSL.id, pardex)
                                            property int size: engin.getPartVSize(projPSL.id, pardex)
                                            Row{
                                                width: parent.width
                                                height: 50
                                                TextArea{
                                                    width: parent.width/4
                                                    height: parent.height
                                                    text: name
                                                    background: Rectangle{
                                                        width: parent.width
                                                        color: root.clear
                                                        radius: 15
                                                        border{
                                                            width: 2
                                                            color: root.stadic
                                                        }
                                                    }
                                                    color: root.stadic
                                                    font.pointSize: 25
                                                    verticalAlignment: Text.AlignVCenter
                                                    onTextChanged: {
                                                        name = text
                                                    }
                                                }
                                                TextArea{
                                                    width: parent.width/2
                                                    height: parent.height
                                                    text: link
                                                    background: Rectangle{
                                                        width: parent.width
                                                        color: root.clear
                                                        radius: 15
                                                        border{
                                                            width: 2
                                                            color: root.stadic
                                                        }
                                                    }
                                                    color: root.stadic
                                                    font.pointSize: 25
                                                    verticalAlignment: Text.AlignVCenter
                                                    onTextChanged: {
                                                        link = text
                                                    }
                                                }
                                                TextArea{
                                                    width: parent.width/16
                                                    height: parent.height
                                                    text: cur
                                                    background: Rectangle{
                                                        width: parent.width
                                                        color: root.clear
                                                        radius: 15
                                                        border{
                                                            width: 2
                                                            color: root.stadic
                                                        }
                                                    }
                                                    color: root.stadic
                                                    font.pointSize: 25
                                                    verticalAlignment: Text.AlignVCenter
                                                    onTextChanged: {
                                                        cur = text
                                                    }
                                                }
                                                TextArea{
                                                    width: parent.width/16
                                                    height: parent.height
                                                    text: price
                                                    background: Rectangle{
                                                        width: parent.width
                                                        color: root.clear
                                                        radius: 15
                                                        border{
                                                            width: 2
                                                            color: root.stadic
                                                        }
                                                    }
                                                    color: root.stadic
                                                    font.pointSize: 25
                                                    verticalAlignment: Text.AlignVCenter
                                                    onTextChanged: {
                                                        price = parseInt(text)
                                                    }
                                                }
                                                Button{
                                                    width: 50
                                                    height: 50
                                                    background:Rectangle {
                                                        anchors {
                                                            fill: parent
                                                            margins: parent.down ? 1 :
                                                                parent.hovered ? 2 :
                                                                    parent.checked ? 3 : 5
                                                        }
                                                        color: root.clear
                                                        radius: 15
                                                        border {
                                                            width: 2
                                                            color: parent.checked ? root.active :
                                                                parent.hovered ? root.hover : root.unactive
                                                        }
                                                    }
                                                    onClicked:{
                                                        size += 1
                                                    }
                                                }
                                                Button{
                                                    width: 50
                                                    height: 50
                                                    background:Rectangle {
                                                        anchors {
                                                            fill: parent
                                                            margins: parent.down ? 1 :
                                                                parent.hovered ? 2 :
                                                                    parent.checked ? 3 : 5
                                                        }
                                                        color: root.clear
                                                        radius: 15
                                                        border {
                                                            width: 2
                                                            color: parent.checked ? root.active :
                                                                parent.hovered ? root.hover : root.unactive
                                                        }
                                                    }
                                                    onClicked:{
                                                        engin.delPart(projPSL.id, pardex)
                                                        projPRP.model = engin.getPartSize(projPSL.id)
                                                    }
                                                }
                                            }
                                            Repeater{
                                                model: size
                                                Row{
                                                    x: 25
                                                    property string val:  engin.getPartValue(projPSL.id, pardex ,index)
                                                    TextArea{
                                                        height: 40
                                                        text: val
                                                        background: Rectangle {
                                                            width: parent.width
                                                            height: parent.height
                                                            color: root.clear
                                                            radius: 15
                                                            border {
                                                                width: 2
                                                                color: root.stadic
                                                            }
                                                        }
                                                        color: root.stadic
                                                        font.pointSize: 20
                                                        verticalAlignment: Text.AlignVCenter
                                                        onTextChanged: {
                                                            val = text
                                                        }
                                                    }
                                                    Button{
                                                        width: 40
                                                        height: 40
                                                        background:Rectangle {
                                                            anchors {
                                                                fill: parent
                                                                margins: parent.down ? 1 :
                                                                    parent.hovered ? 2 :
                                                                        parent.checked ? 3 : 5
                                                            }
                                                            color: root.clear
                                                            radius: 15
                                                            border {
                                                                width: 2
                                                                color: parent.checked ? root.active :
                                                                    parent.hovered ? root.hover : root.unactive
                                                            }
                                                        }
                                                        onClicked:{
                                                            engin.delPartV(projPSL.id, pardex, index)
                                                            size = engin.getPartVSize(projPSL.id, pardex)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Button{
                                width: 50
                                height: 50
                                anchors{
                                    right: parent.right
                                    bottom: parent.bottom
                                }
                                background:Rectangle{
                                    anchors{
                                        fill: parent
                                        margins: parent.down ? 1 :
                                            parent.hovered ? 2:
                                                parent.checked ? 3: 5
                                    }
                                    color: root.clear
                                    radius: 15
                                    border{
                                        width: 2
                                        color: parent.checked ? root.active :
                                            parent.hovered ? root.hover: root.unactive
                                    }
                                }
                                onClicked: {
                                    projPRP.model += 1
                                }
                            }
                        }
                    }
                }
            }
            // files
            Item {
                width: parent.width
                height: parent.height
                Row{
                    anchors{
                        right: parent.right
                        top: parent.top
                    }
                    height: 50
                    TextArea{
                        id: projF
                        property int id: 1
                        width: 0
                        height: parent.height
                        // text: link
                        background: Rectangle{
                            width: parent.width
                            color: root.clear
                            radius: 15
                            border{
                                width: 2
                                color: root.stadic
                            }
                        }
                        color: root.stadic
                        font.pointSize: 15
                        verticalAlignment: Text.AlignVCenter
                    }
                    CheckBox{
                        width: 50
                        height: 50
                        indicator:Rectangle{
                            anchors{
                                fill: parent
                                margins: parent.down ? 1 :
                                    parent.hovered ? 2:
                                        parent.checked ? 3: 5
                            }
                            color: root.clear
                            radius: 15
                            border{
                                width: 2
                                color: parent.checked ? root.active :
                                    parent.hovered ? root.hover: root.unactive
                            }
                        }
                        onClicked: {
                            if (projF.width === 750) {
                                projF.width = 0
                                engin.changePath(projF.text, projF.id)
                            } else {
                                projF.width = 750
                                projF.text = engin.getPath(projF.id)
                            }
                        }
                    }
                }

                Column{
                    width: parent.width
                    height: parent.height-2
                    y: 2
                    // name/logo
                    Row{
                        width: parent.width- 5
                        height: 50
                        x: 5
                        spacing: 5
                        Rectangle{
                            width: parent.height
                            height: parent.height
                            color: root.clear
                            radius: 15
                            border{
                                width: 2
                                color: root.stadic
                            }
                        }
                        Item{
                            width: parent.width - parent.height - 10
                            height: parent.height
                            clip: true
                            Text{
                                id: fileName
                                anchors{fill: parent}
                                text: "Null"
                                font.pointSize: parent.height / 2
                                color: root.stadic
                            }
                        }
                    }
                    // full list
                    ScrollView{
                        width: parent.width
                        height: parent.height-50
                        Column{
                            id: fileDir
                            anchors{fill: parent}
                        }
                    }
                }
            }
            // project specific calender
            Item {
                id: calenderSpecTab
                width: parent.width
                height: parent.height
                Rectangle {
                    width: tabHolder.width
                    height: tabHolder.height
                    color: "orange"
                    Text{text: "under development"}
                }
            }
            /*Row{
                   width: tabHolder.width
                   height: tabHolder.height
                   // left panel
                   Rectangle{
                       width: parent.width / 20
                       height: parent.height
                       color: "pink"
                       Column{
                           anchors.fill: parent
                           Row{
                               width: parent.width
                               height: 20
                               Button{
                                   width: parent.width / 4
                                   height: parent.height
                                   checkable: true
                                   background: Rectangle{
                                       anchors {
                                           fill: parent
                                           margins: parent.down ? 0 :
                                                    parent.hovered ? 0.5 : 1
                                       }
                                   }
                               }
                               Text{
                                   text: "FEB"
                                   width: parent.width /2
                                   height: parent.height
                                   horizontalAlignment: Text.AlignHCenter
                                   verticalAlignment: Text.AlignVCenter
                               }
                               Button{
                                   width: parent.width / 4
                                   height: parent.height
                                   checkable: true
                                   background: Rectangle{
                                       anchors {
                                           fill: parent
                                           margins: parent.down ? 0 :
                                               parent.hovered ? 0.5 : 1
                                       }
                                   }
                               }
                           }
                           Repeater{
                               model: 6
                               Button{
                                   width: parent.parent.width
                                   height: (parent.parent.height-20) / 6
                                   background: Rectangle{
                                       anchors{
                                           fill: parent
                                           margins: 5
                                       }
                                       Column{
                                           Repeater{
                                               model: 2
                                               Image{
                                                   // soure: ""
                                               }
                                           }
                                       }
                                   }
                               }
                           }
                       }
                   }
                   // center panal
                   Column {
                       width: parent.width * 13 / 20
                       height: parent.height
                       // color: "purple"
                       Rectangle{
                           width: parent.width
                           height: 20
                           color: "blue"
                           Row{
                               anchors.fill: parent
                               Repeater{
                                   anchors.fill: parent
                                   model: 7
                                   Item{
                                       width: parent.width / 7
                                       height: parent.height
                                       Rectangle{

                                           color: "green"
                                           anchors{
                                               fill: parent
                                               rightMargin: 5
                                               leftMargin: 5
                                           }
                                           Text {
                                               anchors{
                                                   fill: parent
                                               }
                                               text: index == 0 ? "monday" :
                                                     index == 1 ? "tuesday" :
                                                     index == 2 ? "wensday" :
                                                     index == 3 ? "thursday" :
                                                     index == 4 ? "fryday" :
                                                     index == 5 ? "saterday" :
                                                     index == 6 ? "sunday" : ""
                                               horizontalAlignment: Text.AlignHCenter
                                               verticalAlignment: Text.AlignVCenter
                                           }
                                       }
                                   }
                               }
                           }
                       }

                       Column{
                           // spacing: 5
                           width: parent.width
                           height: parent.height - 20
                           Repeater{
                               model: 6
                               Row{
                                   readonly property int indexx: index
                                   width: parent.parent.width
                                   height: (parent.parent.height  - 20)/ 6
                                   // spacing: 5
                                   Repeater{
                                       model: 7
                                       Button{
                                           readonly property int indexy: index
                                           width: parent.parent.width/7
                                           height: parent.height
                                           background: Rectangle{
                                               anchors{
                                                   fill: parent
                                                   margins:5
                                               }
                                               Column{
                                                   anchors.fill: parent
                                                   Rectangle{
                                                       width: parent.width
                                                       height: parent.height/5
                                                       color: "red"
                                                       Text{
                                                           anchors{
                                                               fill: parent
                                                               rightMargin: 2
                                                           }
                                                           text: indexx * 7 + indexy
                                                           horizontalAlignment: Text.AlignRight
                                                       }
                                                   }
                                                   Text{
                                                       width: parent.width
                                                       height: parent.height * 4 /5
                                                       text: "ebby"
                                                   }
                                               }
                                           }
                                       }
                                   }
                               }
                           }
                       }
                   }
                   // right name
                   Rectangle{
                       width: parent.width * 3/10
                       height: parent.height
                       // anchors{
                       //     right: parent.right
                       // }
                       color: "green"
                       Item{
                           anchors.fill: parent
                           Rectangle{
                               width: parent.width
                               height: 100
                               color: "orange"
                               Text{
                                   text: "febuary 5th"
                                   font.pointSize: 30
                               }
                           }
                           Rectangle{
                               width: parent.width
                               height: 400
                               anchors{
                                   bottom: parent.bottom
                               }
                               clip: true
                               color: "orange"
                               Text{
                                   anchors{
                                       fill: parent
                                       margins: 5
                                   }
                                   text: "kj;alsdjf;ljdsa;lfjdsa;fasdjf;lkjdsa;kfjas;ldkfj;lkdsajf;lkajdsf;lkajds;flkajds;faskdjf;asldkfja;sldkjfa;sldkfja;sdlfja;dslkjf;salkdjf;aslkdjflk"
                                   wrapMode: Text.Wrap


                               }
                           }
                       }
                   }
               }*/
        }
    }

}