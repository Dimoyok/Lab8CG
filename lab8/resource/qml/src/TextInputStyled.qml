import QtQuick 2.2

Item
{
    property int style : 0
    property alias editFocus: text1.focus
    property alias showCursor: text1.cursorVisible
    property alias readOnly: text1.readOnly
    property alias selectByMouse: text1.selectByMouse
    property alias text: text1.text
    property alias horizontalAlignment: text1.horizontalAlignment

    width: 100
    height: 20

    TextInput {
        id: text1
        anchors.fill: parent
        font.bold: false
        font.pixelSize: 8
        font.family: "Arial"

        selectByMouse: true
    }

    state: style

    states: [
        State {
            name: "1"

            PropertyChanges {
                target: text1
                color: "#717880"
                font.bold: false
                font.pixelSize: 19
                font.family: "Arial"
            }
        },
        State {
            name: "2"
            PropertyChanges {
                target: text1
                color: "#ffffff"
                font.bold: true
                font.pixelSize: 11
                font.family: "Arial"
            }
        },
        State {
            name: "3"
            PropertyChanges {
                target: text1
                color: "#6b6b6b"
                font.pixelSize: 15
                font.bold: true
                font.family: "Arial"
            }
        }
        ,
        State {
            name: "4"
            PropertyChanges {
                target: text1
                color: "#ffffff"
                font.pixelSize: 15
                font.bold: true
                font.family: "Arial"
            }
        },
        State {
            name: "5"
            PropertyChanges {
                target: text1
                color: "#fffffa"
                font.pixelSize: 12
                font.bold: false
                font.family: "Arial"
            }
        },
        State {
            name: "6"

            PropertyChanges {
                target: text1
                color: "#717880"
                font.bold: true
                font.pixelSize: 12
                font.family: "Arial"
            }
        },
        State {
            name: "7"
            PropertyChanges {
                target: text1
                color: "#6b6b6b"
                font.pixelSize: 10
                font.bold: true
                font.family: "Arial"
            }
        },
        State {
            name: "8"
            PropertyChanges {
                target: text1
                color: "#dbe8e1"
                font.pixelSize: 36
                font.family: "SegoeUI"
                font.weight : Font.Light
            }
        },
        State {
            name: "9"
            PropertyChanges {
                target: text1
                color: "black"
                font.pixelSize: 12
                font.bold: false
                font.family: "Arial"
            }
        },
        State {
            name: "10"
            PropertyChanges {
                target: text1
                color: "black"
                font.pixelSize: 12
                font.bold: true
                font.family: "Arial"
            }
        },
        State {
            name: "11"
            PropertyChanges {
                target: text1
                color: "#fffffa"
                font.pixelSize: 12
                font.bold: true
                font.family: "Arial"
            }
        },
        State {
            name: "12"
            PropertyChanges {
                target: text1
                color: "#1b1b1b"
                font.pixelSize: 12
                font.family: "SegoeUI"
            }
        },
        State {
            name: "13"
            PropertyChanges {
                target: text1
                color: "#eeeeee"
                font.pixelSize: 12
                font.family: "SegoeUI"
            }
        }
    ]
}

