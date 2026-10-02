import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Button{
    EngineMod{
        id: engin
    }
    property string name: "null"
    property int tab: 0
    property string color
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
                    Text{
                        anchors{fill: parent}
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: parent.parent.parent.parent.parent.down ? 20 :
                            parent.parent.parent.parent.parent.checked ? 18 :
                                parent.parent.parent.parent.parent.hovered ? 18 : 15
                        text: "📄\uFE0E"
                        font.family: "Times New Roman"
                        color: parent.parent.parent.parent.parent.checked ? style.active :
                            parent.parent.parent.parent.parent.hovered ? style.hover: style.unactive
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
        property color hover: "#80" + parent.color
        property color unactive: "#40" + parent.color
        property color active: "#c0" + parent.color
        property color clear: "#00" + parent.color
        property color stadic: "#c0" + parent.color
    }
}