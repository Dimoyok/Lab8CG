import Qt 4.7

Rectangle
{
    id: timeSelector
		
    color: "transparent"
		
    width: imgBackground.width
    height: imgBackground.height

    property alias currentHour: hourList.currentIndex
    property alias currentMinute: minuteList.currentIndex

    property string currentHourString: hourModel.get(currentHour).hourString
    property string currentMinuteString: minuteModel.get(currentMinute).minuteString

    signal hourChanged
    signal minuteChanged
		
    Image
    {
            id: imgBackground

            anchors.centerIn: parent

            opacity: 0.85

            source: "images/timeselector/background.png"
    }
	
    Component
    {
        id: timeDelegateHour

        Text
        {
            x: ( (hour >= 0 && hour <= 9) ? 33: 23 ) + (hourList.currentIndex == hour ? -2 : 0)

            font.family: "Tahoma"
            font.pointSize: 14
            font.bold: hourList.currentIndex == hour

            color: "#363636"

            smooth: true

            text: hour
            style: Text.Raised
            styleColor: "#b9b5b5"
        }
    }

    Component
    {
        id: timeDelegateMin

        Text
        {
            x: ( (minute >= 0 && minute <= 9) ? 30: 20 )  + (minuteList.currentIndex == minute ? -2 : 0)

            font.family: "Tahoma"
            font.pointSize: 14
            font.bold: minuteList.currentIndex == minute

            color: "#363636"

            smooth: true

            text: minute
            style: Text.Raised
            styleColor: "#b9b5b5"
        }
    }
	
    ListModel
    {
        id: hourModel

        ListElement { hour: 0; hourString: "00" }
        ListElement { hour: 1; hourString: "01" }
        ListElement { hour: 2; hourString: "02" }
        ListElement { hour: 3; hourString: "03" }
        ListElement { hour: 4; hourString: "04" }
        ListElement { hour: 5; hourString: "05" }
        ListElement { hour: 6; hourString: "06" }
        ListElement { hour: 7; hourString: "07" }
        ListElement { hour: 8; hourString: "08" }
        ListElement { hour: 9; hourString: "09" }
        ListElement { hour: 10; hourString: "10" }
        ListElement { hour: 11; hourString: "11" }
        ListElement { hour: 12; hourString: "12" }
        ListElement { hour: 13; hourString: "13" }
        ListElement { hour: 14; hourString: "14" }
        ListElement { hour: 15; hourString: "15" }
        ListElement { hour: 16; hourString: "16" }
        ListElement { hour: 17; hourString: "17" }
        ListElement { hour: 18; hourString: "18" }
        ListElement { hour: 19; hourString: "19" }
        ListElement { hour: 20; hourString: "20" }
        ListElement { hour: 21; hourString: "21" }
        ListElement { hour: 22; hourString: "22" }
        ListElement { hour: 23; hourString: "23" }
    }
	
    ListModel
    {
        id: minuteModel
			
        ListElement { minute: 0; minuteString: "00" }
        ListElement { minute: 1; minuteString: "01" }
        ListElement { minute: 2; minuteString: "02" }
        ListElement { minute: 3; minuteString: "03" }
        ListElement { minute: 4; minuteString: "04" }
        ListElement { minute: 5; minuteString: "05" }
        ListElement { minute: 6; minuteString: "06" }
        ListElement { minute: 7; minuteString: "07" }
        ListElement { minute: 8; minuteString: "08" }
        ListElement { minute: 9; minuteString: "09" }
        ListElement { minute: 10; minuteString: "10" }
        ListElement { minute: 11; minuteString: "11" }
        ListElement { minute: 12; minuteString: "12" }
        ListElement { minute: 13; minuteString: "13" }
        ListElement { minute: 14; minuteString: "14" }
        ListElement { minute: 15; minuteString: "15" }
        ListElement { minute: 16; minuteString: "16" }
        ListElement { minute: 17; minuteString: "17" }
        ListElement { minute: 18; minuteString: "18" }
        ListElement { minute: 19; minuteString: "19" }
        ListElement { minute: 20; minuteString: "20" }
        ListElement { minute: 21; minuteString: "21" }
        ListElement { minute: 22; minuteString: "22" }
        ListElement { minute: 23; minuteString: "23" }
        ListElement { minute: 24; minuteString: "24" }
        ListElement { minute: 25; minuteString: "25" }
        ListElement { minute: 26; minuteString: "26" }
        ListElement { minute: 27; minuteString: "27" }
        ListElement { minute: 28; minuteString: "28" }
        ListElement { minute: 29; minuteString: "29" }
        ListElement { minute: 30; minuteString: "30" }
        ListElement { minute: 31; minuteString: "31" }
        ListElement { minute: 32; minuteString: "32" }
        ListElement { minute: 33; minuteString: "33" }
        ListElement { minute: 34; minuteString: "34" }
        ListElement { minute: 35; minuteString: "35" }
        ListElement { minute: 36; minuteString: "36" }
        ListElement { minute: 37; minuteString: "37" }
        ListElement { minute: 38; minuteString: "38" }
        ListElement { minute: 39; minuteString: "39" }
        ListElement { minute: 40; minuteString: "40" }
        ListElement { minute: 41; minuteString: "41" }
        ListElement { minute: 42; minuteString: "42" }
        ListElement { minute: 43; minuteString: "43" }
        ListElement { minute: 44; minuteString: "44" }
        ListElement { minute: 45; minuteString: "45" }
        ListElement { minute: 46; minuteString: "46" }
        ListElement { minute: 47; minuteString: "47" }
        ListElement { minute: 48; minuteString: "48" }
        ListElement { minute: 49; minuteString: "49" }
        ListElement { minute: 50; minuteString: "50" }
        ListElement { minute: 51; minuteString: "51" }
        ListElement { minute: 52; minuteString: "52" }
        ListElement { minute: 53; minuteString: "53" }
        ListElement { minute: 54; minuteString: "54" }
        ListElement { minute: 55; minuteString: "55" }
        ListElement { minute: 56; minuteString: "56" }
        ListElement { minute: 57; minuteString: "57" }
        ListElement { minute: 58; minuteString: "58" }
        ListElement { minute: 59; minuteString: "59" }
    }
	
    Component
    {
        id: timeHighlightHour

        Item
        {
            Image
            {
                    opacity: 0.56

                    source: "images/timeselector/highlight_hour.png"
            }

            Text
            {
                x: 58
                y: 5

                color: "#585757"

                font.family: "Tahoma"
                font.pointSize: 9

                text: "ч"
                smooth: true
                style: Text.Raised
                styleColor: "#d7d7d7"
                font.bold: true
            }
        }
    }

    Component
    {
        id: timeHighlightMin

        Item
        {
            Image
            {
                opacity: 0.56

                source: "images/timeselector/highlight_hour.png"
            }

            Text
            {
                x: 43
                y: 5

                color: "#585757"

                font.family: "Tahoma"
                font.pointSize: 9

                text: "мин"
                smooth: true
                styleColor: "#d7d7d7"
                style: Text.Raised
                font.bold: true
                visible: true
            }

        }
    }

    Rectangle
    {
        id: rcClipRect

        x: 9
        y: 6

        width:	136
        height: 117

        color: "transparent"

        clip: true

        ListView
        {
            id: hourList
            x: -3
            y: -22

            anchors.left: 	parent.left
            anchors.top: 	parent.top
            anchors.bottom: parent.bottom

            width: parent.width/2
            height: 140
            anchors.bottomMargin: 0
            anchors.leftMargin: -3
            anchors.topMargin: -22

            model: 		hourModel
            delegate: 	timeDelegateHour
            highlight: 	timeHighlightHour

            highlightRangeMode: "StrictlyEnforceRange"

            preferredHighlightBegin: 	70
            preferredHighlightEnd: 		70

            flickDeceleration: 1200

            boundsBehavior: Flickable.StopAtBounds
            cacheBuffer: 20

            onMovementEnded:
            {
                timeSelector.hourChanged()
            }
        }

        ListView
        {
            id: minuteList
            x: 65
            y: -22

            anchors.right: 	parent.right
            anchors.top: 	parent.top
            anchors.bottom: parent.bottom

            width: parent.width/2
            height: 139
            anchors.rightMargin: 3
            anchors.bottomMargin: 0
            anchors.leftMargin: -1
            anchors.topMargin: -22

            model: 		minuteModel
            delegate: 	timeDelegateMin
            highlight: 	timeHighlightMin

            highlightRangeMode: "StrictlyEnforceRange"

            preferredHighlightBegin: 	70
            preferredHighlightEnd: 		70

            flickDeceleration: 1200

            boundsBehavior: Flickable.StopAtBounds
            cacheBuffer: 20

            onMovementEnded:
            {
                timeSelector.minuteChanged()
            }
        }
    }

    function scrollToCurrentTime()
    {
        var today = new Date()

        timeSelector.currentHour    = today.getHours();
        timeSelector.currentMinute  = today.getMinutes();
    }

    function setCurrentTime(hour, minute)
    {
        hourList.positionViewAtIndex(hour, ListView.Center);
        minuteList.positionViewAtIndex(minute, ListView.Center);
    }

    function hour()
    {
        return hourList.currentIndex;
    }

    function minute()
    {
        return minuteList.currentIndex;
    }

    function isoString()
    {
        var result = currentHourString + currentMinuteString

        return result
    }

}
