import QtQuick 2.2

Rectangle {
    id: simpleButton

    property alias fontStyle: buttonText.style
    property alias text: buttonText.text
    property bool disabled: false
    property bool hoverEnabled: true
    property bool checkEnabled: false
    property bool checked: false

    //style properties:
    property color buttonColor: "#1d1d1d"
    property color buttonColorOnPressed: "#ffffff"
    property color buttonColorOnHovered: "#3a3a3a"
    property color buttonColorOnChecked: "darkorange"
    property color buttonColorOnDisabled:"#1d1d1d"

    property color borderColor: "#bbbbbb"
    property color borderColorOnPressed: "#ffffff"
    property color borderColorOnHovered: "#bbbbbb"
    property color borderColorOnChecked: "#bbbbbb"
    property color borderColorOnDisabled:"#777777"

    property int textStyle: 11
    property int textStyleOnPressed: 10
    property int textStyleOnHovered: 11
    property int textStyleOnDisabled: 15

    signal clicked()

    width: 90
    height: 32
    color: disabled ? buttonColorOnDisabled : checked ? buttonColorOnChecked : mouseArea.pressed ? buttonColorOnPressed : mouseArea.containsMouse ? buttonColorOnHovered :  buttonColor
    radius: 0
    smooth: true
    border.width: 1
    border.color: disabled ? borderColorOnDisabled : checked ? borderColorOnChecked : mouseArea.pressed ? borderColorOnPressed : mouseArea.containsMouse ? borderColorOnHovered : borderColor

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onClicked:
        {
            if(!disabled)
            {
                if(checkEnabled)
                    checked = !checked
                simpleButton.clicked()
            }
        }

        hoverEnabled: simpleButton.hoverEnabled && !disabled ? true : false
    }

    TR_Label {
        id: buttonText
        text: ""
        style: parent.disabled ? textStyleOnDisabled : mouseArea.pressed ? textStyleOnPressed : mouseArea.containsMouse ? textStyleOnHovered : textStyle
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        smooth: true
    }

    Connections {
        target: extern_mainWindow
        onSignHoverDisable:
        {
            simpleButton.hoverEnabled = false
        }
        onSignHoverEnable:
        {
            simpleButton.hoverEnabled = true
        }
    }
}
