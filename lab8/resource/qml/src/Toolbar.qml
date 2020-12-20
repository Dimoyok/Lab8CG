import QtQuick 2.2

Rectangle
{
    id: root

    property alias name: caption.text
    property bool showDateTime: false

    width: 800
    height: 50
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#e6e5e5"
        }

        GradientStop {
            position: 1
            color: "#b3b9ca"
        }
    }
    border.color: "#00888c99"

    TR_Label {
        id: caption
        x: 0
        y: 2
        anchors.fill: parent
        text: "Главное меню"
        anchors.rightMargin: 0
        anchors.bottomMargin: -2
        anchors.leftMargin: 0
        anchors.topMargin: 2
        style: 3
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
    }

    TR_Label {
        id: txtCurrentTime
        x: 1212
        y: 0
        width: 49
        height: 24
        text: shDatabase.currentTime
        smooth: true
        anchors.verticalCenterOffset: -8
        anchors.right: parent.right
        anchors.rightMargin: 19
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: 128
        style: 1
        horizontalAlignment: 4
        visible: root.showDateTime
    }

    TR_Label {
        id: txtCurrentDate
        x: 1212
        y: 24
        width: 50
        height: 16
        text: shDatabase.currentDate
        smooth: true
        anchors.horizontalCenter: txtCurrentTime.horizontalCenter
        anchors.top: txtCurrentTime.bottom
        anchors.topMargin: 0
        opacity: 1
        horizontalAlignment: 4
        verticalAlignment: 128
        style: 6
        visible: root.showDateTime
    }
}
