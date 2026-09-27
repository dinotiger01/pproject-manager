import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Button{
    EngineMod{
        id: engin
    }
    property int id: -1
    property string name: "null"
    property bool done: false
    width: tex.implicitWidth + 50
    height: 40
    x: 25
    checkable: true
    background: Rectangle {
        anchors.fill: parent
        anchors.margins: parent.down ? 2 :
            parent.hovered ? 4 : 5
        color: style.clear
        radius: 8
        border{
            width: 2
            color: parent.checked ? style.active :
                parent.hovered ? style.hover: style.unactive
        }
        Text{
            id: tex
            text: name
            height: parent.height
            // width: parent.width - 50
            x: parent.height+ 5
            font.pointSize: height /2
            color: parent.parent.checked ? style.active :
                   parent.parent.hovered ? style.hover: style.unactive
        }
    }
    Button {
        width: parent.height
        height: parent.height
        background: Rectangle {
            anchors {
                fill: parent
                margins: parent.down ? 8 :
                    parent.hovered ? 9 : 10
            }
            color: done ? style.stadic : style.clear
            radius: 8
            border {
                width: 2
                color: parent.parent.checked ? style.active :
                       parent.parent.hovered ? style.hover : style.unactive
            }
        }
        onClicked: {
            done = !done
        }
    }
    onClicked:{

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