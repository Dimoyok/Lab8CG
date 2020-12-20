import QtQuick 2.2

Rectangle
{
    id: scrollbar

    //Flickable parameters to be linked:
    property real visibleArea_yPosition: 0
    property real visibleArea_heightRatio: 0
    property real flickableItemHeight: 100
    ////////////////////////////////////

    y: visibleArea_yPosition * flickableItemHeight
    width: 4
    height: visibleArea_heightRatio * flickableItemHeight
    color: "#b8b8b8"

    border.width: 1
    border.color: "#4d4d4d"

    opacity: (visibleArea_heightRatio > 1.0) ? 0.0 : 1.0
}


// Another darker version with opacity changing while moving
/*
Rectangle
{
    id: scrollbar
    anchors.right: parent.right
    y: parent.visibleArea.yPosition * parent.height
    width: 10
    height: parent.visibleArea.heightRatio * parent.height
    color: "darkgrey"
    radius: 5

    opacity: (parent.visibleArea.heightRatio == 1.0) ? 0.0 : (parent.moving ? 0.3 : 0.1)

    Behavior on opacity { NumberAnimation {duration: 300} }
}
*/
