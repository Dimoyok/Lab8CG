import QtQuick 2.2

Item {
    id: root
    width: 200
    height: 50

    property alias text: caption.text
    property alias checked: togglebutton1.checked

    signal toggled()

    ToggleButton {
        id: togglebutton1
        x: 5
        y: 19
        anchors.verticalCenter: parent.verticalCenter
        paddingChecked: "images/checkbox/checked.png"
        paddingUnchecked: "images/checkbox/unchecked.png"

        onClicked: root.toggled()
    }

    Text {
        id: caption
        x: 29
        y: 13
        width: 271
        height: font.pixelSize+3
        color: "#333333"
        text: ""
        smooth: true
        font.family: "Arial"
        font.bold: true
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 15
    }

    MouseArea {
        id: mouse_area1
        anchors.fill: parent

        onClicked: togglebutton1.toggle()
    }
}
