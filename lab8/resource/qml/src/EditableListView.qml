import QtQuick 2.2

ListView {
    id: editableListView

    property bool selectable: true
    property bool autoSelect: false
    property bool isEditing: false
    property string currentItemName
    property string currentItemDescription1
    property int currentItemIndex
    property int itemHeight: 40
    property int cornerRadius: 0
    property int textStyleCommon: 9
    property int textStyleSelected: 5
    property color borderColor: "#ffffff"
    property color borderHighlightColor: "#ececec"
    property int gradientCoeff: 5.0

    signal itemSelected()
    signal itemSelectedWhileEditing()

    function resetEditState()
    {
    }

    width: 250
    height: count*itemHeight
    interactive: true
    boundsBehavior: Flickable.StopAtBounds
    visible: true

    delegate: Item {
        id: wrapper
        height: itemHeight
        width: editableListView.width
        property bool bDeleteActive: false

        signal selected()

        Behavior on y {  NumberAnimation { duration: 300 } }

        ListView.onRemove: SequentialAnimation {
            PropertyAction { target: wrapper; property: "ListView.delayRemove"; value: true }
            NumberAnimation { target: wrapper; property: "scale"; to: 0; duration: 300 }
            PropertyAction { target: wrapper; property: "ListView.delayRemove"; value: false }
        }

        Rectangle
        {
            property bool isCurrent: name == editableListView.currentItemName

            clip: true

            anchors.fill: parent

            Behavior on anchors.leftMargin { NumberAnimation { duration: 200 } }

            Rectangle
            {
                id: selectionRectangle

                anchors.fill: parent
                color: mouseArea.containsMouse ? "#1d1d1d" : "#ffffff"
            }

            MouseArea
            {
                id: mouseArea
                anchors.fill: parent

                property int pressX
                property int pressY

                hoverEnabled: true

                onPressed:
                {
                    pressX = mouse.x;
                    pressY = mouse.y;
                }

                onReleased:
                {
                    var dx = mouse.x - pressX;
                    var dy = mouse.y - pressY;

                    var dxAbs = dx < 0 ? -dx : dx;
                    var dyAbs = dy < 0 ? -dy : dy;

                    if(dxAbs < 10 && dyAbs < 10)
                    {
                        if(editableListView.selectable)
                        {
                            if(!isEditing)
                            {
                                editableListView.currentItemIndex = index
                                editableListView.currentItemName = name
                                editableListView.currentItemDescription1 = description1
                                editableListView.itemSelected()
                            }
                            else
                            {
                                editableListView.currentItemIndex = index
                                editableListView.currentItemName = name
                                editableListView.currentItemDescription1 = description1
                                editableListView.itemSelectedWhileEditing()
                            }
                        }
                    }
                    else if(dx > 30 && dyAbs < 10)
                    {
                        bDeleteActive = !bDeleteActive
                        console.log("bDeleteActive = " + bDeleteActive)
                    }
                }
            }

            TR_Label {
                id: txtDescription1
                anchors.fill: parent
                anchors.leftMargin: isEditing ? 35 : 5
                text: description1
                verticalAlignment: Text.AlignVCenter
                style: mouseArea.containsMouse ? textStyleSelected : textStyleCommon

                Behavior on anchors.leftMargin { NumberAnimation { duration: 200 } }
            }

            PushButton
            {
                id: deleteButton

                paddingOnPressed: extern_iconsAbsPath + "../listview/redbutton.png"
                paddingOnReleased: extern_iconsAbsPath + "../listview/redbutton.png"
                anchors.verticalCenter: txtDescription1.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: (bDeleteActive) ? 5 : -(deleteButton.width + 10)
                text: "Удалить"
                textStyle: 2

                Behavior on anchors.rightMargin { NumberAnimation { duration: 200 } }

                onClicked:
                {
                    editableListView.model.startEditing()
                    editableListView.model.removeItem(name)
                    editableListView.model.applyEditing();
                }
            }
        }

        Image
        {
            opacity: isEditing ? 1.0 : 0.0
            anchors.verticalCenter: parent.verticalCenter
            source: extern_iconsAbsPath + "../listview/delete.png"

            Image
            {
                anchors.centerIn: parent
                source: extern_iconsAbsPath + "../listview/delete_icon.png"
                smooth: true

                rotation: bDeleteActive ? 90.0 : 0.0

                Behavior on rotation { NumberAnimation { duration: 200 } }
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: bDeleteActive = !bDeleteActive
            }

            Behavior on opacity { NumberAnimation { duration: 200 } }
        }

        Component.onCompleted:
        {
            if(autoSelect && index == 0 && editableListView.selectable)
            {
                editableListView.currentItemIndex = index
                editableListView.currentItemName = name
                editableListView.currentItemDescription1 = description1
                editableListView.itemSelected()
            }
        }
    }

    Scrollbar
    {
        id: scrollbar
        anchors.right: parent.right
        color: "darkgrey"
        visibleArea_yPosition: parent.visibleArea.yPosition
        visibleArea_heightRatio: parent.visibleArea.heightRatio
        flickableItemHeight: parent.height
    }
}
