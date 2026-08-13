import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls

//fuck AI (personal opinon)

Window {
    id : root
    width: 1024
    height: 580
    visible: true
    color: Qt.rgba(0,0,255,1)
    title: "Project Manager"
    //top bar selector
    Rectangle {
        id: topBar
        width: parent.width
        height: 50
        color: "red"
        Rectangle{
            id: topBarContainer
            height: parent.height
            width : 512
            color: "orange"
            Row{
                anchors.fill: parent
                ButtonGroup{
                    id: mainButton
                }
                Repeater{
                    model: 4
                    anchors.fill: parent
                    Button{
                        required property int index
                        width: parent.width / 4
                        height: parent.height
                        checkable: true
                        onClicked: tabHolder.currentIndex = index
                        ButtonGroup.group: mainButton
                        background: Rectangle{
                            anchors{
                                fill: parent
                                margins: parent.down ? 1 :
                                    parent.hovered ? 2:
                                        parent.checked ? 3: 5
                            }
                            radius: 15
                            color: "green"
                            Text{
                                anchors{
                                    fill: parent
                                    // margins: 5
                                }
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.pointSize: parent.parent.down ? 22.5 :
                                    parent.parent.hovered ? 22 :
                                        parent.parent.checked ? 21 : 20
                                text: index == 0 ? "Home" :
                                        index == 1 ? "Project" :
                                            index == 2 ? "List" :
                                                index == 3 ? "Calender" : ""
                            }
                        }
                    }
                }
            }
            // TabBar{
            //     id: topBarRow
            //     background: Item{}
            //     spacing: 10
            //     anchors.centerIn: topBarContainer
            //     anchors.left : topBarContainer.left
            //     //home logo
            //     TabButton {
            //         id: home
            //         width:  down ? 120 :
            //                 hovered ? 110 :
            //                 checked ? 110 : 100
            //         height: down ? 50 :
            //                 hovered ? 45 :
            //                 checked ? 45 : 40
            //         hoverEnabled: true
            //         background: Rectangle{
            //             color: "light blue"
            //             radius : 15
            //             Text{
            //                 text: "home"
            //                 anchors.centerIn: parent
            //                 font.pointSize: home.down ? 26 :
            //                                 home.hovered ? 24 :
            //                                 home.checked ? 24 : 20
            //             }
            //         }
            //     }
            //     // projects
            //     TabButton{
            //         id: projs
            //         width:  down ? 140 :
            //                 hovered ? 130 :
            //                 checked ? 130 : 120
            //         height: down ? 50 :
            //                 hovered ? 45 :
            //                 checked ? 45 : 40
            //         background: Rectangle{
            //             color: "pink"
            //             radius : 15
            //             Text{
            //                 text: "projects"
            //                 anchors.centerIn: parent
            //                 font.pointSize: projs.down ? 26 :
            //                                 projs.hovered ? 24 :
            //                                 projs.checked ? 24 : 20
            //             }
            //         }
            //     }
            //     // list
            //     TabButton {
            //         id: list
            //         width:  down ? 120 :
            //                 hovered ? 110 :
            //                 checked ? 110 : 100
            //         height: down ? 50 :
            //                 hovered ? 45 :
            //                 checked ? 45 : 40
            //         background: Rectangle{
            //             color: "green"
            //             radius : 15
            //             Text{
            //                 text: "list"
            //                 anchors.centerIn: parent
            //                 font.pointSize: list.down ? 26 :
            //                                 list.hovered ? 24 :
            //                                 list.checked ? 24 : 20
            //             }
            //         }
            //     }
            //     // calender
            //     TabButton {
            //         id: cal
            //         width:  down ? 140 :
            //                 hovered ? 130 :
            //                 checked ? 130 : 120
            //         height: down ? 50 :
            //                 hovered ? 45 :
            //                 checked ? 45 : 40
            //         background: Rectangle {
            //             color: "purple"
            //             radius: 15
            //             Text {
            //                 text: "calender"
            //                 anchors.centerIn: parent
            //                 font.pointSize: cal.down ? 26 :
            //                                 cal.hovered ? 24 :
            //                                 cal.checked ? 24 : 20
            //             }
            //         }
            //     }
            // }
        }
    }
    StackLayout {
        id: tabHolder
        width: parent.width
        height: parent.height - topBarContainer.height
        anchors.bottom: parent.bottom
        currentIndex: 0
        // home
        Item{
            id: homeTab
            Rectangle{
                anchors.fill: parent
                color: "blue"
                // todo list today
                Rectangle{
                    height: parent.height
                    width: parent.width / 2
                    color: "orange"
                    anchors{
                        left: parent.left
                    }
                    ScrollView{
                        anchors{fill: parent}
                        Column{
                            anchors{
                                fill: parent
                            }
                            Repeater{
                                anchors.fill: parent
                                model : 30
                                // tasks
                                Button{
                                    required property int index
                                    width: parent.width
                                    height: 50
                                    background: Rectangle{
                                        anchors{
                                            fill: parent
                                            margins: 5
                                        }
                                        color: "green"
                                        Text{
                                            text: index;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                // date time
                Rectangle{
                    width: parent.width/ 2
                    height: 50
                    color: "pink"
                    anchors{
                        right: parent.right
                    }
                    //link to timeer becouse why not
                    Button{
                        height: parent.height
                        width: 250
                        anchors{right: parent.right}
                        background: Rectangle{
                            anchors{fill: parent}
                            Text {
                                anchors{fill: parent}
                                text: "0/0/0000 : 15:00"
                                horizontalAlignment: Text.AlignRight
                                font.pointSize: parent.height /2
                            }
                        }
                    }
                }
                // hyper notes secttion
                Rectangle{
                    width: parent.width / 2
                    height: parent.height - 50
                    anchors{
                        right: parent.right
                        bottom: parent.bottom
                    }
                    color: "purple"
                    Column{
                        anchors.fill: parent
                        Rectangle{
                            width: parent.width
                            height: 30
                            Row{
                                anchors.fill: parent
                                Repeater{
                                    anchors.fill: parent
                                    model: 7
                                    Button{
                                        width: 30
                                        height: 30
                                        checkable: true
                                        background: Rectangle{
                                            color: "cyan"
                                            anchors{
                                                fill: parent
                                                margins: parent.down ? 0 :
                                                         parent.checked ? 1 :
                                                         parent.hovered ? 2 : 3
                                            }
                                            Text{
                                                text: "I"
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        TextArea{
                            width: parent.width
                            height: parent.height - 30
                            color : "black"
                            background: Item{}
                        }
                    }
                }
            }
        }

        // projects
        Item{
            id: projectTab
            Rectangle{
                id: projListCon
                width: tabHolder.width
                height: tabHolder.height
                color: "green"
                // left project list
                Rectangle{
                    id: projListsWrapper
                    width: parent.width / 2
                    height: parent.height
                    color: "purple"
                    ButtonGroup{
                        id: projListButtonGroup
                        onCheckedButtonChanged: {
                            // somethin somthing c++ function(index)
                        }
                    }
                    ScrollView{
                        id: projListScroll
                        anchors.fill: parent
                        clip: true
                        Column{
                            id: projTabButtonCon
                            // anchors.fill: parent
                            spacing: 0
                            Repeater{
                                model: 100
                                Button{
                                    required property int index
                                    width: projListScroll.width
                                    height: 150
                                    // text: index
                                    checkable: true
                                    // potProjTabHolder.currentIndex = index
                                    ButtonGroup.group: projListButtonGroup
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    background: Rectangle {
                                        anchors.fill: parent
                                        anchors.margins: parent.down ? 0 :
                                                         parent.hovered ? 2 :
                                                         parent.checked ? 2 : 5
                                        radius: 15
                                        color: "green"
                                        Text{
                                            text: "project name"
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
                                                text: "short description a;jsd;lak;slkfasdfkj;alksdj;al sdf;aklsjf;akjd sf;kasjdf;kaj  sdf;kkajs;fkjas;dfkjad;sfja;s  kdlj;askld as;lkdf;al ksdfj;alksd f;aklsdf;lsdkj;asldkf;asldkfa ;skdfj;asdk fja;sdlkja;lskdj fa;lskd;asldkf;alskdffsadf asdf asdf dsf dfa sdfa sdf sdf sadf sdf asdf gdsag asdgasd  sadga sdg sdg sda g asdgasdgdg asdgasdg sdgsdgasdgs dgasdgasdg "
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
                                }
                            }
                        }
                    }
                }
                // right project BUTTon
                Rectangle{
                    id: projProjTabHolder
                    width: parent.width / 2
                    height: parent.height
                    anchors.right: parent.right
                    Column{
                        id: projDesTabWrapper
                        anchors{
                            fill: parent
                            margins: 15
                        }
                        spacing: 15
                        Rectangle{
                            width: parent.width
                            height: parent.height / 4 - 7.5
                            color: "green"
                            Rectangle{
                                width: parent.height - 20
                                height: parent.height - 20
                                color: "red"
                                anchors{
                                    left: parent.left
                                    verticalCenter: parent.verticalCenter
                                    margins: 10
                                }
                            }
                            Text{
                                width: parent.width - parent.height - 10
                                height: parent.height
                                anchors{
                                    margins: 10
                                    right: parent.right
                                }
                                text: "asfk';kd'sal;f';laskdf'laksefasjdl;k j;lkja dlkfjsa as;dl ;sdkj "
                                font.pointSize: 30
                                wrapMode: Text.Wrap
                                clip: true
                            }
                        }
                        Rectangle{
                            width: parent.width
                            height: parent.height * 0.75 - 7.5
                            Row{
                                spacing: 15
                                anchors.fill: parent
                                Rectangle{
                                    width: parent.width / 2.5
                                    height: parent.height
                                    color: "yellow"
                                    clip: true
                                    Column{
                                        anchors.fill: parent
                                        Repeater{
                                            model: 7
                                            // all project
                                            Button{
                                                required property int index
                                                width: parent.width
                                                height: parent.height / 7
                                                onClicked: tabHolder.currentIndex = index + 4
                                                background: Rectangle{
                                                    anchors{
                                                        fill: parent
                                                        margins: parent.hovered ?  8 : 10
                                                    }
                                                    color: "light blue"
                                                    radius: 15
                                                    Text{
                                                        text: index == 0 ? "All":
                                                                index == 1 ? "To-Do":
                                                                    index == 2 ? "Notes":
                                                                        index == 3 ? "Links":
                                                                            index == 4 ? "Parts":
                                                                                index == 5 ? "Files":
                                                                                    index == 6 ? "Calender":""
                                                        anchors{
                                                            horizontalCenter: parent.horizontalCenter
                                                            verticalCenter: parent.verticalCenter
                                                        }
                                                        font.pointSize: parent.height - 15 > parent.width/ text.length ? parent.width/ text.length : parent.height - 15
                                                    }
                                                }
                                            }
                                        }
                                        // // to-do
                                        // Button{
                                        //     width: parent.width
                                        //     height: parent.height / 7
                                        //     background: Rectangle{
                                        //         anchors{
                                        //             fill: parent
                                        //             margins: 10
                                        //         }
                                        //         color: "light blue"
                                        //         radius: 15
                                        //         Text{
                                        //             text: "To-Do"
                                        //             anchors{
                                        //                 horizontalCenter: parent.horizontalCenter
                                        //                 verticalCenter: parent.verticalCenter
                                        //             }
                                        //             font.pointSize: parent.height - 15
                                        //         }
                                        //     }
                                        // }
                                        // // notes
                                        // Button{
                                        //     width: parent.width
                                        //     height: parent.height / 7
                                        //     background: Rectangle{
                                        //         anchors{
                                        //             fill: parent
                                        //             margins: 10
                                        //         }
                                        //         color: "light blue"
                                        //         radius: 15
                                        //         Text{
                                        //             text: "Notes"
                                        //             anchors{
                                        //                 horizontalCenter: parent.horizontalCenter
                                        //                 verticalCenter: parent.verticalCenter
                                        //             }
                                        //             font.pointSize: parent.height - 15
                                        //         }
                                        //     }
                                        // }
                                        // // quicklinks
                                        // Button{
                                        //     width: parent.width
                                        //     height: parent.height / 7
                                        //     background: Rectangle{
                                        //         anchors{
                                        //             fill: parent
                                        //             margins: 10
                                        //         }
                                        //         color: "light blue"
                                        //         radius: 15
                                        //         Text{
                                        //             text: "Links"
                                        //             anchors{
                                        //                 horizontalCenter: parent.horizontalCenter
                                        //                 verticalCenter: parent.verticalCenter
                                        //             }
                                        //             font.pointSize: parent.height - 15
                                        //         }
                                        //     }
                                        // }
                                        // // part-list
                                        // Button{
                                        //     width: parent.width
                                        //     height: parent.height / 7
                                        //     background: Rectangle{
                                        //         anchors{
                                        //             fill: parent
                                        //             margins: 10
                                        //         }
                                        //         color: "light blue"
                                        //         radius: 15
                                        //         Text{
                                        //             text: "Part List"
                                        //             anchors{
                                        //                 horizontalCenter: parent.horizontalCenter
                                        //                 verticalCenter: parent.verticalCenter
                                        //             }
                                        //             font.pointSize: parent.height - 15
                                        //         }
                                        //     }
                                        // }
                                        // // calender
                                        // Button{
                                        //     width: parent.width
                                        //     height: parent.height / 7
                                        //     background: Rectangle{
                                        //         anchors{
                                        //             fill: parent
                                        //             margins: 10
                                        //         }
                                        //         color: "light blue"
                                        //         radius: 15
                                        //         Text{
                                        //             text: "Calender"
                                        //             anchors{
                                        //                 horizontalCenter: parent.horizontalCenter
                                        //                 verticalCenter: parent.verticalCenter
                                        //             }
                                        //             font.pointSize: parent.height - 15
                                        //         }
                                        //     }
                                        // }
                                        // // files
                                        // Button{
                                        //     width: parent.width
                                        //     height: parent.height / 7
                                        //     background: Rectangle{
                                        //         anchors{
                                        //             fill: parent
                                        //             margins: 10
                                        //         }
                                        //         color: "light blue"
                                        //         radius: 15
                                        //         Text{
                                        //             text: "Files"
                                        //             anchors{
                                        //                 horizontalCenter: parent.horizontalCenter
                                        //                 verticalCenter: parent.verticalCenter
                                        //             }
                                        //             font.pointSize: parent.height - 15
                                        //         }
                                        //     }
                                        // }
                                    }
                                }

                                Rectangle{
                                    width: parent.width - parent.width / 2.5 - 15
                                    height: parent.height
                                    // anchors{
                                    //     right: parent.right
                                    // }
                                    color: "green"
                                    Text{
                                        // width: parent.width
                                        height: parent.height /10
                                        text: "featers"
                                        font.pointSize: 30
                                        anchors{
                                            horizontalCenter: parent.horizontalCenter
                                            margins: 10
                                        }
                                    }
                                    Text{
                                        width: parent.width- 20
                                        height: parent.height * 9 / 10 - 30
                                        wrapMode: Text.WordWrap
                                        textFormat: Text.RichText
                                        text: "<ul><li>asd fdsfasdf</li><li>booya</li><li>'a;sdl asdasd asad asda sasd as asd asd asd asd asd asd asd asd fasd fad qe asd</li><li>goopy</li><li>eppy</li><li>glazmta</li><li>opensourse</li><li>caffine</li><li>:yay:</li></ul>"
                                        clip: true
                                        anchors{
                                            bottom: parent.bottom
                                            horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        // list
        Item{
            id: listTab
            Rectangle{
                id: potListCon
                width: tabHolder.width
                height: tabHolder.height
                color: "green"
                // left project list
                Rectangle{
                    id: potListsWrapper
                    width: parent.width / 2
                    height: parent.height
                    color: "purple"
                    ButtonGroup{
                        id: potListButtonGroup
                        onCheckedButtonChanged: {
                            // for(let i = 0; i < potTabButtonCon.children.lenght; i++){
                            //     if(potTabButtonCon.children[i]=== chekedButton){
                            //         potProjTabHolder.currentIndex = i;
                            //         break;
                            //     }
                            // }

                            // somethin somthing c++ function(index)
                        }
                    }
                    ScrollView{
                        id: potListScroll
                        anchors.fill: parent
                        clip: true
                        Column{
                            id: potTabButtonCon
                            anchors.fill: parent
                            spacing: 0
                            Repeater{
                                model: 100
                                Button{
                                    required property int index
                                    width: potListScroll.width
                                    height: 75
                                    // text: index
                                    checkable: true
                                    // potProjTabHolder.currentIndex = index
                                    ButtonGroup.group: potListButtonGroup
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    background: Rectangle {
                                        anchors.fill: parent
                                        anchors.margins: parent.down ? 0 :
                                            parent.hovered ? 2 :
                                                parent.checked ? 2 : 5
                                        radius: 15
                                        color: "green"
                                        Text{
                                            text: "project name"
                                            font.pointSize: 20
                                            x: 10
                                            anchors.verticalCenter: parent.verticalCenter
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                // right project descripsoin
                Rectangle{
                    id: potProjTabHolder
                    width: parent.width / 2
                    height: parent.height
                    anchors.right: parent.right
                    Column{
                        id: potProjTabWrapper
                        anchors{
                            fill: parent
                            margins: 15
                        }
                        spacing: 15
                        Rectangle{
                            width: parent.width
                            height: parent.height / 4 - 7.5
                            color: "green"
                            Text{
                                anchors{
                                    fill: parent
                                    margins: 10
                                }
                                text: "asfk';kd'sal;f';laskdf'laksefasjdl;k j;lkja dlkfj as;dl ;sdkj (title)"
                                font.pointSize: 20
                                wrapMode: Text.Wrap
                                clip: true
                            }
                        }
                        Rectangle{
                            width: parent.width
                            height: parent.height * 0.75 - 7.5
                            color: "yellow"
                            clip: true
                            Text{
                                anchors{
                                    fill: parent
                                    margins: 10
                                }
                                text: "kasl;k';d asd 'akdlsf'a;lskf ;alskd ';alks f'aksd ';lka';fl k'sd; fk';k d'lk 'a;slkf 'a;sl 'kd s;laks d'faks d'falskd f';las kf';ldks 'ak ssadfadf;lkadj;dlsj;asdlk ;lskdfj (description)"
                                wrapMode: Text.Wrap
                                clip: true
                            }
                        }
                    }
                }
            }
        }
        // callender
        Item {
            id: calenderTab
            Row{
                width: tabHolder.width
                height: tabHolder.height
                // left panel
                Rectangle{
                    width: parent.width / 20
                    height: parent.height
                    color: "pink"
                    Column{
                        anchors.fill: parent
                        Item{
                            width: parent.width
                            height: 20
                            Text{
                                text: "feb"
                                anchors{
                                    fill: parent
                                }
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Repeater{
                            model: 6
                            Button{
                                width: parent.parent.width
                                height: (parent.parent.height-20) / 6
                                background: Rectangle{
                                    anchors{
                                        fill: parent
                                        margins: 5
                                    }
                                }
                            }
                        }
                    }
                }
                // center panal
                Column {
                    width: parent.width * 13 / 20
                    height: parent.height
                    // color: "purple"
                    Rectangle{
                        width: parent.width
                        height: 20
                        color: "blue"
                        Row{
                            anchors.fill: parent
                            Repeater{
                                anchors.fill: parent
                                model: 7
                                Item{
                                    width: parent.width / 7
                                    height: parent.height
                                    Rectangle{

                                        color: "green"
                                        anchors{
                                            fill: parent
                                            rightMargin: 5
                                            leftMargin: 5
                                        }
                                        Text {
                                            anchors{
                                                fill: parent
                                            }
                                            text: index == 0 ? "monday" :
                                                  index == 1 ? "tuesday" :
                                                  index == 2 ? "wensday" :
                                                  index == 3 ? "thursday" :
                                                  index == 4 ? "fryday" :
                                                  index == 5 ? "saterday" :
                                                  index == 6 ? "sunday" : ""
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Column{
                        // spacing: 5
                        width: parent.width
                        height: parent.height - 20
                        Repeater{
                            model: 6
                            Row{
                                readonly property int indexx: index
                                width: parent.parent.width
                                height: (parent.parent.height  - 20)/ 6
                                // spacing: 5
                                Repeater{
                                    model: 7
                                    Button{
                                        readonly property int indexy: index
                                        width: parent.parent.width/7
                                        height: parent.height
                                        background: Rectangle{
                                            anchors{
                                                fill: parent
                                                margins:5
                                            }
                                            Column{
                                                anchors.fill: parent
                                                Rectangle{
                                                    width: parent.width
                                                    height: parent.height/5
                                                    color: "red"
                                                    Text{
                                                        anchors{
                                                            fill: parent
                                                            rightMargin: 2
                                                        }
                                                        text: indexx * 7 + indexy
                                                        horizontalAlignment: Text.AlignRight
                                                    }
                                                }
                                                Text{
                                                    width: parent.width
                                                    height: parent.height * 4 /5
                                                    text: "ebby"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                // right name
                Rectangle{
                    width: parent.width * 3/10
                    height: parent.height
                    // anchors{
                    //     right: parent.right
                    // }
                    color: "green"
                    Item{
                        anchors.fill: parent
                        Rectangle{
                            width: parent.width
                            height: 100
                            color: "orange"
                        }
                        Rectangle{
                            width: parent.width
                            height: 400
                            anchors{
                                bottom: parent.bottom
                            }
                            color: "orange"
                        }
                    }
                }
            }

        }
        // all
        Item {
            id: allTab
            Rectangle {
                width: tabHolder.width
                height: tabHolder.height
                color: "red"
            }
        }
        // todo
        Item {
            id: todoTab
            Rectangle {
                width: tabHolder.width
                height: tabHolder.height
                color: "green"
            }
        }
        // notes
        Item {
            id: notTab
            Rectangle {
                width: tabHolder.width
                height: tabHolder.height
                color: "yellow"
            }
        }
        // links
        Item {
            id: linkTab
            Rectangle {
                width: tabHolder.width
                height: tabHolder.height
                color: "white"
            }
        }
        // parts
        Item {
            id: partsTab
            Rectangle {
                width: tabHolder.width
                height: tabHolder.height
                color: "black"
            }
        }
        // files
        Item {
            id: fileTab
            Rectangle {
                width: tabHolder.width
                height: tabHolder.height
                color: "orange"
            }
        }
        // project specific calender
        Item {
            id: calenderSpecTab
            Rectangle {
                width: tabHolder.width
                height: tabHolder.height
                color: "purple"
            }
        }
        //stopwatch/ timer
        Item {
            id: stopwatchTab
            Rectangle {
                width: tabHolder.width
                height: tabHolder.height
                color: "cyan"
            }
        }
    }
}
