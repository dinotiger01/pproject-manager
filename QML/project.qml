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
    property string logo: "null"
    property string color
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
        color: style.clear
        radius: 15
        border{
            width: 2
            color: parent.checked ? style.active :
                   parent.hovered ? style.hover: style.unactive
        }
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
            color: parent.parent.checked ? style.active :
                parent.parent.hovered ? style.hover: style.unactive
        }
        Rectangle{
            width: parent.parent.down ? 80 :
                parent.parent.hovered ? 77:
                    parent.parent.checked ? 77 : 75
            height: parent.parent.down ? 80 :
                parent.parent.hovered ? 77:
                    parent.parent.checked ? 77 : 75
            color: style.clear
            radius: 10
            border{
                width: 2
                color: parent.parent.checked ? style.active :
                    parent.parent.hovered ? style.hover: style.unactive
            }
            anchors{
                bottom: parent.bottom
                left: parent.left
                margins: 10
            }
        }
        Item{
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
                color: parent.parent.parent.checked ? style.active :
                       parent.parent.parent.hovered ? style.hover: style.unactive
            }
        }
    }
    onClicked:{
        engin.deselect()
        checked = true
        engin.selProj(id)
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