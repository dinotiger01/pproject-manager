import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Button{
    EngineMod{
        id: engin
    }
    property string name: "null"
    width: 1024/2
    height: 75
    checkable: true
    background: Rectangle {
        anchors.fill: parent
        anchors.margins: parent.down ? 0 :
                        parent.hovered ? 2 :
                        parent.checked ? 2 : 5
        radius: 15
        color: "green"
        Text{
            text: name
            anchors{
                fill: parent
                margins: 5
            }
            font.pointSize: height /2
        }
    }
    onClicked:{
        engin.deselect()
        checked = true
    }
}