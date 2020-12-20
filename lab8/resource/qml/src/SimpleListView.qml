import QtQuick 2.2

ListView {
    id: listView

    property bool selectable: true
    property bool autoSelect: false
    property string currentItemName
    property string currentItemDescription1
    property int currentItemIndex
    property int itemHeight: 40
    property real cornerRadius: 12
    property color borderColor: "#c2c3c3"
    property color borderHighlightColor: "#ececec"
    property int r0: 245
    property int g0: 245
    property int b0: 245
    property int r1: 240
    property int g1: 240
    property int b1: 242
    property int gradientCoeff: 5.0

    signal itemSelected()

    width: 250
    height: count*itemHeight+2
    interactive: false
    visible: true

    delegate: Item {
        id: wrapper
        height: itemHeight
        width: listView.width

        Rectangle
        {
            property bool isCurrent: name == listView.currentItemName

            clip: true

            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: -1
            anchors.rightMargin: 1
            height: parent.height+1
            border.color: listView.borderColor
            radius: 12
            smooth: true

            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.rgba((r0-gradientCoeff*index)/255.0,(g0-gradientCoeff*index)/255.0,(b0-gradientCoeff*index)/255.0, 1.0) }
                GradientStop { position: 1.0; color: Qt.rgba((r1-gradientCoeff*index)/255.0,(g1-gradientCoeff*index)/255.0,(b1-gradientCoeff*index)/255.0, 1.0) }
            }

            Rectangle
            {
                anchors { fill: parent; leftMargin: 2; topMargin: 2 }
                color: "#c5c8cc"
                opacity: parent.isCurrent ? 0.6 : 0.0
            }

            MouseArea
            {
                anchors.fill: parent
            }

            Text
            {
                id: txtDescription1

                color: description1Color
                text: description1
                anchors.left: icon.right
                anchors.leftMargin: 7
                font.pixelSize: 17
                font.family: "Arial"
                anchors.verticalCenter: parent.verticalCenter
            }

            Text
            {
                id: txtDescription2

                color: description2Color
                text: description2
                anchors.right: parent.right
                anchors.rightMargin: 10
                font.pixelSize: 15
                font.family: "Arial"

                y: txtDescription1.y
            }

            Image {
                id: icon
                anchors.verticalCenter: txtDescription1.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                source: iconPath
            }
         }
    }
}
