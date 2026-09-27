import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Column{
    id: parents
    width: 1024
    clip: true
    EngineMod{
        id: engin
    }
    property string name: "null"
    property int id
    property int tab: 0
    property string color
    Button{
        width: tex.implicitWidth + 60
        height: 50
        x: tab * 25
        checkable: true
        background: Rectangle {
            anchors.fill: parent
            anchors.margins: parent.down ? 0 :
                            parent.hovered ? 2 :
                            parent.checked ? 2 : 5
            color: style.clear
            radius: 10
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
                        radius: 10
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
                    font.pointSize: height /2
                    color: parent.parent.parent.checked ? style.active :
                           parent.parent.parent.hovered ? style.hover: style.unactive
                }
            }
        }

        onClicked:{
            closed = !closed
        }
        property bool closed: true
        state: closed ? "edit-closed" : "edit-open"
        states: [
            State{
                name: "edit-open"
                PropertyChanges{
                    target: parents; height: undefined
                }
            },
            State{
                name: "edit-closed"
                PropertyChanges{
                    target: parents; height: 50
                }
            }
        ]
        transitions: Transition{
            NumberAnimation{
                properties: "height"
                duration: parents.children.length * 75
                easing.type: Easing.InOutQuad
            }
        }
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
