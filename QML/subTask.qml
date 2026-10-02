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
    property int dex: -1
    property int dexx: -1
    property string color
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
            engin.subCheckers(id,dex,dexx,done);
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