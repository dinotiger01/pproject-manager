import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Button{
    EngineMod{
        id: engin
    }
    property string name: "null"
    width: 1024
    height: 75
    background: Rectangle {
        anchors.fill: parent
        anchors.margins: parent.down ? 0 :
            parent.hovered ? 2 : 5
        radius: 15
        color: "purple"
        Text{
            text: name
            anchors{
                fill: parent
                margins: 5
            }
            font.pointSize: 25
        }
    }
}