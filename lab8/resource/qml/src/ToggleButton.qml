import QtQuick 2.2

Item
{
    id: button

    property alias text: buttonText.text
    property alias textStyle: buttonText.style

    property alias inputEnabled: mouseArea.enabled

    property alias paddingChecked:      paddingChecked.source
    property alias paddingUnchecked: 	paddingUnchecked.source

    property alias iconChecked: 	iconChecked.source
    property alias iconUnchecked: 	iconUnchecked.source

    property bool checked: false

    signal clicked()

    width:  paddingUnchecked.width
    height: paddingUnchecked.height

    Behavior on opacity { NumberAnimation { duration: 200 } }

	Image
	{
        id: paddingUnchecked
			
		anchors.centerIn: parent
		
        visible: !button.checked

		Image
		{
			anchors.centerIn: parent
			
            id: iconUnchecked
		}
	}

	Image
	{
        id: paddingChecked

		anchors.centerIn: parent

        visible: button.checked

		Image
		{
			anchors.centerIn: parent

            id: iconChecked
		}
	}
	
	MouseArea
    {
		id: 			mouseArea;
     	anchors.fill: 	parent

        onClicked:	toggle()
	}

    TR_Label {
        id: buttonText
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        smooth: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    function toggle()
    {
        button.checked = !button.checked
        button.clicked()
    }
}
