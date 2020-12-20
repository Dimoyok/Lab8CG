// import QtQuick 2.2 // to target S60 5th Edition or Maemo 5
import QtQuick 2.2

Item {
    id: root
    property alias model: listView.model
    property alias cacheBuffer: listView.cacheBuffer

    property int itemHeight: 20
    width: 1024
    height: 768

    ListView {
        id: listView

        currentIndex: -1

        anchors.fill: parent
        anchors.topMargin: header.height

        delegate:  Row {
            property int rowIndex: index
            Repeater {
                model: listView.model.columnCount
                Rectangle {
                    property int rowIndex: parent.rowIndex
                    width: listView.model.columnWidth(index);
                    height: root.itemHeight
                    visible: rowIndex == 0 ? false: true;

                    color: listView.currentIndex == rowIndex ? "#dddddd" :  "#eeeeee"
                    border.color: "#999999"
                    border.width: 1

                    clip: true

                    Text {
                        anchors.fill: parent
                        horizontalAlignment:    Text.AlignHCenter
                        verticalAlignment:      Text.AlignVCenter
                        text: listView.model.value(parent.rowIndex, index)
                        font.bold: parent.rowIndex == 0
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:
                        {
                            if(rowIndex > 0)
                                listView.currentIndex = rowIndex
                        }
                    }
                }
            }
        }
    }

    Row {
        property int offset: -listView.visibleArea.yPosition/listView.visibleArea.heightRatio*listView.height;

        y: offset > 0 ? offset : 0

        Repeater {
            id: header
            anchors { left: parent.left; right: parent.right; top: parent.top; }
            height: root.itemHeight
            width: root.width

            model: listView.model.columnCount
            Rectangle {
                property int rowIndex: parent.rowIndex
                width: listView.model.columnWidth(index);
                height: root.itemHeight

                color: "#cccccc";
                border.color: "#999999"
                border.width: 1

                clip: true

                Text {
                    anchors.fill: parent
                    horizontalAlignment:    Text.AlignHCenter
                    verticalAlignment:      Text.AlignVCenter
                    text: listView.model.value(0, index)
                    font.bold: true
                }
            }
        }
    }
}
