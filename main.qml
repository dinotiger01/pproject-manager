import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls

//fuck AI (personal opinon)

Window {
    id : root
    width: 1024
    height: 580
    visible: true
    color: Qt.rgba(0,0,255,1)
    title: "Project Manager"
    //top bar selector
    Rectangle {
        id: topBar
        width: parent.width
        height: 50
        color: "red"
        Rectangle{
            id: topBarContainer
            height: parent.height
            width : 500
            color: "orange"
            TabBar{
                id: topBarRow
                background: Item{}
                spacing: 10
                anchors.centerIn: topBarContainer
                anchors.left : topBarContainer.left
                //home logo
                TabButton {
                    id: home
                    width:  down ? 120 :
                            hovered ? 110 :
                            checked ? 110 : 100
                    height: down ? 50 :
                            hovered ? 45 :
                            checked ? 45 : 40
                    hoverEnabled: true
                    background: Rectangle{
                        color: "light blue"
                        radius : 15
                        Text{
                            text: "home"
                            anchors.centerIn: parent
                            font.pointSize: home.down ? 26 :
                                            home.hovered ? 24 :
                                            home.checked ? 24 : 20
                        }
                    }
                }
                // projects
                TabButton{
                    id: projs
                    width:  down ? 140 :
                            hovered ? 130 :
                            checked ? 130 : 120
                    height: down ? 50 :
                            hovered ? 45 :
                            checked ? 45 : 40
                    background: Rectangle{
                        color: "pink"
                        radius : 15
                        Text{
                            text: "projects"
                            anchors.centerIn: parent
                            font.pointSize: projs.down ? 26 :
                                            projs.hovered ? 24 :
                                            projs.checked ? 24 : 20
                        }
                    }
                }
                // list
                TabButton {
                    id: list
                    width:  down ? 120 :
                            hovered ? 110 :
                            checked ? 110 : 100
                    height: down ? 50 :
                            hovered ? 45 :
                            checked ? 45 : 40
                    background: Rectangle{
                        color: "green"
                        radius : 15
                        Text{
                            text: "list"
                            anchors.centerIn: parent
                            font.pointSize: list.down ? 26 :
                                            list.hovered ? 24 :
                                            list.checked ? 24 : 20
                        }
                    }
                }
                // calender
                TabButton {
                    id: cal
                    width:  down ? 140 :
                            hovered ? 130 :
                            checked ? 130 : 120
                    height: down ? 50 :
                            hovered ? 45 :
                            checked ? 45 : 40
                    background: Rectangle {
                        color: "purple"
                        radius: 15
                        Text {
                            text: "calender"
                            anchors.centerIn: parent
                            font.pointSize: cal.down ? 26 :
                                            cal.hovered ? 24 :
                                            cal.checked ? 24 : 20
                        }
                    }
                }
            }
        }

    }
    StackLayout {
        id: tabHolder
        width: parent.width
        height: parent.height - topBarContainer.height
        anchors.bottom: parent.bottom
        currentIndex: topBarRow.currentIndex
        // home
        Item{
            id: homeTab
            Rectangle{
                width: tabHolder.width
                height: tabHolder.height
                color: "blue"
                // todo list today
                Rectangle{
                    width: 100
                    height: 100
                    color: "green"
                }
            }
        }
        // projects
        Item{
            id: projectsTab
            Rectangle{
                width: tabHolder.width
                height: tabHolder.height
                color: "pink"
            }
        }
        // list
        Item{
            id: listTab
            Rectangle{
                width: tabHolder.width
                height: tabHolder.height
                color: "green"
                // left project list
                Rectangle{
                    id: potListsCon
                    width: parent.width / 2
                    height: parent.height
                    color: "blue"
                    ScrollView{
                        id: potListScroll
                        width: parent.width
                        height: parent.height
                        ListView{
                            id: listView
                            model: 20
                            spacing: 50
                            delegate: ItemDelegate {
                                Rectangle{
                                    width: tabHolder.width / 2 - 20
                                    height: 50
                                    anchors.centerIn: listView
                                    Text{
                                        text: index
                                    }
                                }

                                required property int index
                            }
                        }

                    }
                }
                // right project descripsoin
                Rectangle{
                    width: parent.width / 2
                    height: parent.height
                    anchors.right: parent.right
                    color: "purple"
                }
            }
        }
        // callender
        Item {
            id: calenderTab
            Rectangle {
                width: tabHolder.width
                height: tabHolder.height
                color: "purple"
            }
        }
    }
}
