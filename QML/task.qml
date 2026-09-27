import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Column{
    id: parents
    width: 1024
    clip: true
    EngineMod{
        id: engin
    }
    property string name: "null"
    property int id: -1
    property bool done: false
    Button{
        width: tex.implicitWidth + 50
        height: 50
        checkable: true
        background: Rectangle {
            anchors.fill: parent
            anchors.margins: parent.down ? 0 :
                            parent.hovered ? 2 :
                            parent.checked ? 2 : 5
            color: style.clear
            radius: 10
            border{
                width: 2
                color: parent.checked ? style.active :
                    parent.hovered ? style.hover: style.unactive
            }
            Text{
                id: tex
                text: name
                height: parent.height
                x: parent.height
                font.pointSize: height /2
                color: parent.parent.checked ? style.active :
                       parent.parent.hovered ? style.hover: style.unactive
            }
        }
        Button{
            width: parent.height
            height: parent.height
            background: Rectangle{
                anchors {
                    fill: parent
                    margins: parent.down ? 8 :
                        parent.hovered ? 9 : 10
                }
                color: done ? style.stadic : style.clear
                radius: 10
                border{
                    width: 2
                    color: parent.parent.checked ? style.active :
                        parent.parent.hovered ? style.hover: style.unactive
                }
            }
            onClicked:{
                done = !done
            }
        }
        onClicked:{
            closed = !closed
        }
        property bool closed: true
        state: closed ? "edit-closed" : "edit-open"
        states: [
            State{
                name: "edit-open"
                PropertyChanges{
                    target: parents; height: undefined
                }
            },
            State{
                name: "edit-closed"
                PropertyChanges{
                    target: parents; height: 50
                }
            }
        ]
        transitions: Transition{
            NumberAnimation{
                properties: "height"
                duration: parents.children.length * 75
                easing.type: Easing.InOutQuad
            }
        }
    }
    Item{
        id: style
        property color background: Qt.rgba(0,255,255,0.5)
        property color checked: Qt.rgba(0,255,0,0.5)
        property color hover: Qt.rgba(0,255,0,0.5)
        property color unactive: Qt.rgba(0,255,0,0.25)
        property color active: Qt.rgba(0,255,0,0.75)
        property color clear: Qt.rgba(0,0,0,0)
        property color stadic: Qt.rgba(0,255,0,0.5)
    }
}
