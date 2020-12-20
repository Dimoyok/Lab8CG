// import QtQuick 2.2 // to target S60 5th Edition or Maemo 5
import QtQuick 2.2

Rectangle {
    id: root
    property alias text: text_input1.text
    property int index: -1
    width: 80
    height: 80
    color: "#eeeeee"
    border.color: "#999999"
    border.width: 1

    clip: true

    Text {
        id: text_input1
        wrapMode: TextInput.WordWrap
        anchors.fill: parent
        font.family: "Arial"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 12
    }
}
