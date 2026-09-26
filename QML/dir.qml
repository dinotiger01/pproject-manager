import QtQuick
import QtQuick.Controls.Basic
import EngineMod

Column{
    id: parents
    property string name: "null"
    EngineMod{
        id: engin
    }
    clip: true
    Button{
        width: 1024
        height: 75
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
                font.pointSize: 25
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
                    target: parents; height: 75
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
}