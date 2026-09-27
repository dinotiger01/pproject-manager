import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Button{
    EngineMod{
        id: engin
    }
    property string name: "null"
    property int id: -1
    width: 1024/2
    height: 75
    checkable: true
    background: Rectangle {
        anchors.fill: parent
        anchors.margins: parent.down ? 0 :
                        parent.hovered ? 2 :
                        parent.checked ? 2 : 5
        color: style.clear
        radius: 15
        border{
            width: 2
            color: parent.checked ? style.active :
                parent.hovered ? style.hover: style.unactive
        }
        Text{
            text: name
            anchors{
                fill: parent
                margins: 5
            }
            font.pointSize: height /2
            color: parent.parent.checked ? style.active :
                parent.parent.hovered ? style.hover: style.unactive
        }
    }
    onClicked:{
        engin.deselect()
        checked = true
        engin.selProto(id)
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