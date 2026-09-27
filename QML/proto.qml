import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Button{
    EngineMod{
        id: engin
    }
    property string name: "null"
    property int id: -1
    property string color
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
        property color hover: "#80" + parent.color
        property color unactive: "#40" + parent.color
        property color active: "#c0" + parent.color
        property color clear: "#00" + parent.color
        property color stadic: "#c0" + parent.color
    }
}