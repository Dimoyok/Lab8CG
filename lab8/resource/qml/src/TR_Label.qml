import QtQuick 2.2

Item
{
    property int style : 0
    property alias text: text1.text
    property alias textPaintedWidth: text1.paintedWidth
    property alias textPaintedHeight: text1.paintedHeight
    property alias horizontalAlignment: text1.horizontalAlignment
    property alias verticalAlignment: text1.verticalAlignment
    property alias backgroundOpacity: background.opacity
    property alias backgroundColor: background.color

    property int    backgroundBorderWidth: 2
    property color  backgroundBorderColor: "#808080"

    width: 100
    height: 20

    Rectangle
    {
        id: background
        anchors.fill: parent
        color: "#ffffff"
        border.width: backgroundBorderWidth
        border.color: backgroundBorderColor
        opacity: 0.0
    }

    Text {
        id: text1
        anchors.fill: parent
        font.bold: false
        font.pixelSize: 8
        font.family: "Arial"
        smooth: parent.smooth
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
                style: "Raised"
                styleColor: "#ece1e1"
            }
        },
        State {
            name: "2"
            PropertyChanges {
                target: text1
                color: "#ffffff"
                font.bold: true
                font.pixelSize: 11
                style: "Sunken"
                styleColor: "#5a5a5a"
                font.family: "Arial"
            }
        },
        State {
            name: "3"
            PropertyChanges {
                target: text1
                color: "#6b6b6b"
                font.pixelSize: 15
                style: "Raised"
                styleColor: "#ffffff"
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
                style: "Sunken"
                styleColor: "#5a5a5a"
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
                style: "Normal"
                styleColor: "#000000"
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
                style: "Raised"
                styleColor: "#ece1e1"
            }
        },
        State {
            name: "7"
            PropertyChanges {
                target: text1
                color: "#6b6b6b"
                font.pixelSize: 10
                style: "Raised"
                styleColor: "#ffffff"
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
                style: "Normal"
                styleColor: "black"
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
                style: "Normal"
                styleColor: "black"
                //font.bold: true
                font.family: "Arial"
            }
        },
        State {
            name: "11"
            PropertyChanges {
                target: text1
                color: "#fffffa"
                font.pixelSize: 12
                style: "Normal"
                styleColor: "#fffffa"
                //font.bold: true
                font.family: "Arial"
            }
        },
        State {
            name: "12"
            PropertyChanges {
                target: text1
                color: "#1b1b1b"
                font.pixelSize: 12
                style: Text.Raised;
                styleColor: "#1b1b1b"
                font.family: "SegoeUI"
            }
        },
        State {
            name: "13"
            PropertyChanges {
                target: text1
                color: "#eeeeee"
                font.pixelSize: 12
                style: Text.Raised;
                styleColor: "#eeeeee"
                font.family: "SegoeUI"
            }
        },
        State {
            name: "14"
            PropertyChanges {
                target: text1
                color: "#777777"
                font.pixelSize: 12
                style: Text.Raised;
                styleColor: "#777777"
                font.family: "SegoeUI"
            }
        },
        State {
            name: "15"
            PropertyChanges {
                target: text1
                color: "#777777"
                font.pixelSize: 12
                style: "Normal"
                //font.bold: true
                styleColor: "#777777"
                font.family: "Arial"
            }
        },
        State {
            name: "16"
            PropertyChanges {
                target: text1
                color: "darkorange"
                font.pixelSize: 12
                style: "Normal"
                styleColor: "darkorange"
                //font.bold: true
                font.family: "Arial"
            }
        }
    ]
}
