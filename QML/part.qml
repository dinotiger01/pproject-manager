import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Button{
    id: par
    EngineMod{
        id: engin
    }
    Item{
        id: style
        property color hover: "#80" + parent.color
        property color unactive: "#40" + parent.color
        property color active: "#c0" + parent.color
        property color clear: "#00" + parent.color
        property color stadic: "#c0" + parent.color
    }
    property int id: -1
    property int price: -1
    property string name: "null"
    property string cur: "null"
    property string desc: "null"
    property string color
    width: 1024
    height: des.implicitHeight + 50
    checkable: true
    clip: true
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
        Column{
            width: parent.width
            Item{
                width: parent.width
                height: 75
                Text{
                    id: nameed
                    text: name
                    height: parent.height
                    font.pointSize: height /2
                    color: parent.parent.parent.parent.checked ? style.active :
                           parent.parent.parent.parent.hovered ? style.hover: style.unactive
                }
                Text{
                    id: pry
                    text: cur + price + " "
                    anchors{right: parent.right}
                    height: parent.height
                    font.pointSize: height /2
                    color: parent.parent.parent.parent.checked ? style.active :
                           parent.parent.parent.parent.hovered ? style.hover: style.unactive
                }
            }
            Text{
                id: des
                width: parent.width
                text: desc
                textFormat: Text.MarkdownText
                font.pointSize: 20
                color: parent.parent.parent.checked ? style.active :
                       parent.parent.parent.hovered ? style.hover: style.unactive
            }
        }
    }
    onCheckedChanged:{
        closed = checked
    }
    onClicked:{
        engin.deselect()
        checked = true
    }
    property bool closed: false
    state: !closed ? "edit-closed" : "edit-open"
    states: [
        State{
            name: "edit-open"
            PropertyChanges{
                target: par; height: des.implicitHeight + 80
            }
        },
        State{
            name: "edit-closed"
            PropertyChanges{
                target: par; height: 75
            }
        }
    ]
    transitions: Transition{
        NumberAnimation{
            properties: "height"
            duration: 250
            easing.type: Easing.InOutQuad
        }
    }
}
