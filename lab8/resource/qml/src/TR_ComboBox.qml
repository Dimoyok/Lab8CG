import QtQuick 2.2

Item
{
    id: comboBox
    width: 200
    height: 20

    property int textStyle: 9

    property bool isEditable: false

    property string style: "bright"
    property string stylePath: "file:///" + extern_appPath + "/resource/images/styles/" + style + "/"

    property alias borderColor: editablelistview1.borderColor
    property alias borderHighlightColor: editablelistview1.borderHighlightColor

    property alias  text:             text1.text
    property alias  internalText:     editablelistview1.currentItemName
    property alias  currentItemIndex: editablelistview1.currentItemIndex
    property alias  model:            editablelistview1.model

    property int itemHeight: 40

    property alias count:      editablelistview1.count
    property alias listHeight: editablelistview1.height

    signal droppedDown()
    signal risedUp()
    signal currentIndexChanged()
    signal activated()

    function hideCombo()
    {
        comboBox.state = ""
    }

    function setCurrentItemIndex(index)
    {
        editablelistview1.currentItemIndex = index
        comboBox.currentIndexChanged()
    }

    Item {
        id: item1
        height: 500
        clip: true

        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.bottom
        anchors.topMargin: 1

        EditableListView {
            id: editablelistview1
            y: -height
            anchors { left: parent.left; right: parent.right }
            opacity: 1

            itemHeight: comboBox.itemHeight

            Behavior on y {
                NumberAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuart
                }
            }
            autoSelect: true

            onItemSelected: comboBox.setCurrentItemIndex(editablelistview1.currentItemIndex), comboBox.state = ""
        }
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#ffffff"
        //source: stylePath + "textfield/background.png"
        //sourceSize.width:   parent.width
        //sourceSize.height:  parent.height

        Image {
            id: arrowDownImage
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            source: stylePath + "combobox/drop_down_icon_down.png"
            sourceSize.width: parent.width
            sourceSize.height: parent.height

            MouseArea {
                id: mousearea1
                anchors.fill: parent
                onClicked:
                {
                    if(comboBox.state == "")
                    {
                        comboBox.state = "stateDropDown"
                        if(comboBox.isEditable && text1.text != editablelistview1.currentItemDescription1)
                        {
                            comboBox.model.setElementName(text1.text, editablelistview1.currentItemIndex)
                        }
                    }
                    else
                        comboBox.state = ""
                }
            }
        }

        TextInputStyled
        {
            id: text1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 2
            anchors.bottom: parent.bottom
            anchors.right: arrowDownImage.left
            anchors.leftMargin: 5
            text: comboBox.model.getElementName(editablelistview1.currentItemIndex)
            style: comboBox.textStyle
            readOnly: !comboBox.isEditable
        }
    }

    states: [
        State {
            name: ""
            PropertyChanges {
                target: text1
                readOnly: false
                selectByMouse: true
            }
        },
        State {
            name: "stateDropDown"

            PropertyChanges {
                target: editablelistview1
                y: 0
                opacity: 1
            }

            PropertyChanges {
                target: item1
                x: 4
                y: 53
                width: 307
                height: 500
                opacity: 1
            }

            PropertyChanges {
                target: text1
                opacity: 1
                readOnly: true
                selectByMouse: false
            }
        }
    ]

    transitions: [
        Transition {
            to: "stateDropDown"
            ScriptAction { script: comboBox.droppedDown(), comboBox.activated() }
        },

        Transition {
            from: "stateDropDown"
            ScriptAction { script: comboBox.risedUp(), comboBox.activated() }
        }
    ]
}
