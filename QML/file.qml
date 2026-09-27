import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Button{
    EngineMod{
        id: engin
    }
    property string name: "null"
    property int tab: 0
    width: tex.implicitWidth + 56
    x: tab * 25
    height: 50
    // checkable: true
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
        Row{
            width: parent.width
            height: parent.height
            Item{
                width: parent.height
                height: parent.height
                Rectangle{
                    anchors {
                        fill: parent
                        margins: 5
                    }
                    color: style.clear
                    radius: 8
                    border{
                        width: 2
                        color: parent.parent.parent.parent.checked ? style.active :
                            parent.parent.parent.parent.hovered ? style.hover: style.unactive
                    }
                }
            }
            Text{
                id: tex
                text: name
                height: parent.height
                width: parent.width - 50
                font.pointSize: height /2
                color: parent.parent.parent.checked ? style.active :
                    parent.parent.parent.hovered ? style.hover: style.unactive
            }
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