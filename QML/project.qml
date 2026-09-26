import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Button{
    EngineMod{
        id: engin
    }
    property int id: 0
    property string name: "null"
    property string des: "null"
    // required property int index
    // width: projListScroll.width
    height: 150
    width: 1024/2
    // text: index
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
            font.pointSize: parent.parent.down ? 22.5 :
                parent.parent.hovered ? 21.5:
                    parent.parent.checked ? 21.5 : 20
            anchors{
                left: parent.left
                top: parent.top
                margins: 10
            }
        }
        Rectangle{
            width: parent.parent.down ? 80 :
                parent.parent.hovered ? 77:
                    parent.parent.checked ? 77 : 75
            height: parent.parent.down ? 80 :
                parent.parent.hovered ? 77:
                    parent.parent.checked ? 77 : 75
            color: "red"
            anchors{
                bottom: parent.bottom
                left: parent.left
                margins: 10
            }
        }
        Rectangle{
            width: parent.width - 105
            height: parent.parent.down ? 85 :
                parent.parent.hovered ? 83:
                    parent.parent.checked ? 83 : 80
            anchors{
                bottom: parent.bottom
                right: parent.right
            }
            clip: true
            Text{
                width: parent.width - 105
                height: 75
                text: des
                wrapMode: Text.Wrap
                font.pointSize: parent.parent.down ? 12 :
                    parent.parent.hovered ? 11:
                        parent.parent.checked ? 11 : 10

                anchors{
                    fill: parent
                    margins: 10
                }
            }
        }
    }
    onClicked:{
        engin.deselect()
        checked = true
        engin.selProj(id)
    }
}