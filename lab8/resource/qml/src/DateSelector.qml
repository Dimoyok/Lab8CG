import Qt 4.7

Rectangle
{
    id: dateSelector

    color: "transparent"

    width: imgBackground.width
    height: imgBackground.height

    property alias currentDayIndex:      dayList.currentIndex
    property alias currentMonthIndex:    monthList.currentIndex
    property alias currentYearIndex:     yearList.currentIndex

    property string currentDay : dayModel.get(currentDayIndex).dayString
    property string currentMonth : monthModel.get(currentMonthIndex).monthString
    property string currentYear: yearModel.get(currentYearIndex).year

    signal dayChanged
    signal monthChanged
    signal yearChanged

    Image
    {
        id: imgBackground

        anchors.centerIn: parent

        opacity: 0.85

        source: "images/dateselector/background.png"
    }

    Component
    {
        id: dateDelegateDay

        Text
        {
            x: ( (day >= 0 && day <= 9) ? 30: 25 ) + (dayList.currentIndex == index ? -2 : 0)
            height: 25

            font.family: "Tahoma"
            font.pointSize: 14
            font.bold: dayList.currentIndex == index

            color: "#363636"

            smooth: true

            text: day
            style: Text.Raised
            styleColor: "#b9b5b5"
        }
    }

    Component
    {
        id: monthDelegate

        Text
        {
            x: 20

            font.family: "Tahoma"
            font.pointSize: 14
            font.bold: monthList.currentIndex == index

            color: "#363636"

            smooth: true

            text: month
            style: Text.Raised
            styleColor: "#b9b5b5"
        }
    }

    Component
    {
        id: yearDelegate

        Text
        {
            x: yearList.currentIndex == index ? 12 : 17

            font.family: "Tahoma"
            font.pointSize: 14
            font.bold: yearList.currentIndex == index

            color: "#363636"

            smooth: true

            text: year
            style: Text.Raised
            styleColor: "#b9b5b5"
        }
    }

    ListModel
    {
        id: dayModel

        ListElement { day: 1; dayString: "01" }
        ListElement { day: 2; dayString: "02" }
        ListElement { day: 3; dayString: "03" }
        ListElement { day: 4; dayString: "04" }
        ListElement { day: 5; dayString: "05" }
        ListElement { day: 6; dayString: "06" }
        ListElement { day: 7; dayString: "07" }
        ListElement { day: 8; dayString: "08" }
        ListElement { day: 9; dayString: "09" }
        ListElement { day: 10; dayString: "10" }
        ListElement { day: 11; dayString: "11" }
        ListElement { day: 12; dayString: "12" }
        ListElement { day: 13; dayString: "13" }
        ListElement { day: 14; dayString: "14" }
        ListElement { day: 15; dayString: "15" }
        ListElement { day: 16; dayString: "16" }
        ListElement { day: 17; dayString: "17" }
        ListElement { day: 18; dayString: "18" }
        ListElement { day: 19; dayString: "19" }
        ListElement { day: 20; dayString: "20" }
        ListElement { day: 21; dayString: "21" }
        ListElement { day: 22; dayString: "22" }
        ListElement { day: 23; dayString: "23" }
        ListElement { day: 24; dayString: "24" }
        ListElement { day: 25; dayString: "25" }
        ListElement { day: 26; dayString: "26" }
        ListElement { day: 27; dayString: "27" }
        ListElement { day: 28; dayString: "28" }
        ListElement { day: 29; dayString: "29" }
        ListElement { day: 30; dayString: "30" }
        ListElement { day: 31; dayString: "31" }
    }

    ListModel
    {
        id: monthModel

        ListElement { month: "Янв"; monthString: "01" }
        ListElement { month: "Фев"; monthString: "02" }
        ListElement { month: "Мар"; monthString: "03" }
        ListElement { month: "Апр"; monthString: "04" }
        ListElement { month: "Май"; monthString: "05" }
        ListElement { month: "Июн"; monthString: "06" }
        ListElement { month: "Июл"; monthString: "07" }
        ListElement { month: "Авг"; monthString: "08" }
        ListElement { month: "Сен"; monthString: "09" }
        ListElement { month: "Окт"; monthString: "10" }
        ListElement { month: "Ноя"; monthString: "11" }
        ListElement { month: "Дек"; monthString: "12" }
    }

    ListModel
    {
        id: yearModel

        ListElement { year: 2000 }
        ListElement { year: 2001 }
        ListElement { year: 2002 }
        ListElement { year: 2003 }
        ListElement { year: 2004 }
        ListElement { year: 2005 }
        ListElement { year: 2006 }
        ListElement { year: 2007 }
        ListElement { year: 2008 }
        ListElement { year: 2009 }
        ListElement { year: 2010 }
        ListElement { year: 2011 }
        ListElement { year: 2012 }
        ListElement { year: 2013 }
        ListElement { year: 2014 }
        ListElement { year: 2015 }
        ListElement { year: 2016 }
        ListElement { year: 2017 }
        ListElement { year: 2018 }
        ListElement { year: 2019 }
        ListElement { year: 2020 }
        ListElement { year: 2021 }
        ListElement { year: 2022 }
        ListElement { year: 2023 }
        ListElement { year: 2024 }
        ListElement { year: 2025 }
        ListElement { year: 2026 }
        ListElement { year: 2027 }
        ListElement { year: 2028 }
        ListElement { year: 2029 }
        ListElement { year: 2030 }
        ListElement { year: 2031 }
    }

    Component
    {
        id: dateHighlightDay

        Item
        {
            Image
            {
                opacity: 0.56

                source: "images/dateselector/highlight_hour.png"
            }
        }
    }

    Component
    {
        id: monthHighlight

        Item
        {
            Image
            {
                opacity: 0.56

                source: "images/dateselector/highlight_min.png"
            }
        }
    }

    Component
    {
        id: yearHighlight

        Item
        {
            Image
            {
                opacity: 0.56

                source: "images/dateselector/highlight_hour.png"
            }
        }
    }

    Rectangle
    {
        id: rcClipRect

        x: 9
        y: 5

        width:	221
        height: 118

        color: "transparent"

        clip: true

        ListView
        {
            id: dayList
            x: -1
            y: -25
            width: 69

            anchors.left: 	parent.left
            anchors.top: 	parent.top
            anchors.bottom: parent.bottom

            height: 143
            anchors.bottomMargin: 0
            anchors.leftMargin: -1
            anchors.topMargin: -25

            model: 		dayModel
            delegate: 	dateDelegateDay
            highlight: 	dateHighlightDay

            highlightRangeMode: "StrictlyEnforceRange"

            preferredHighlightBegin: 	70
            preferredHighlightEnd: 		70

            flickDeceleration: 1200

            boundsBehavior: Flickable.StopAtBounds
            cacheBuffer: 20

            onMovementEnded:
            {
                dateSelector.dayChanged()
            }
        }

        ListView
        {
            id: monthList
            x: 68
            y: -25
            width: 74

            anchors.top:    parent.top
            anchors.bottom: parent.bottom

            height: 143
            anchors.bottomMargin: 0
            keyNavigationWraps: false
            anchors.topMargin: -25

            model: 	monthModel
            delegate: 	monthDelegate
            highlight: 	monthHighlight

            highlightRangeMode: "StrictlyEnforceRange"

            preferredHighlightBegin: 	70
            preferredHighlightEnd: 		70

            flickDeceleration: 1200

            boundsBehavior: Flickable.StopAtBounds

            onMovementEnded:
            {
                dateSelector.checkCurrentDate()
                dateSelector.monthChanged()
            }
        }

        ListView
        {
            id: yearList
            x: 138
            y: -25

            anchors.top: 	parent.top
            anchors.bottom: parent.bottom

            anchors.rightMargin: 9

            width: 75
            height: 143
            anchors.bottomMargin: 0
            keyNavigationWraps: false
            anchors.topMargin: -25

            model: 	yearModel
            delegate: 	yearDelegate
            highlight: 	yearHighlight

            highlightRangeMode: "StrictlyEnforceRange"

            preferredHighlightBegin: 	70
            preferredHighlightEnd: 		70

            flickDeceleration: 1200

            boundsBehavior: Flickable.StopAtBounds

            onMovementEnded:
            {
                dateSelector.checkCurrentDate()
                dateSelector.yearChanged()
            }
        }
    }

    function setCurrentTime(hour, minute)
    {
   //     hourList.positionViewAtIndex(hour, ListView.Center);
   //     minuteList.positionViewAtIndex(minute, ListView.Center);
    }

    function day()
    {
        return dayList.currentIndex;
    }

    function month()
    {
        return monthList.currentIndex;
    }

    function year()
    {
        return yearList.currentIndex;
    }

    function isoString()
    {
        var result

        result = currentYear + currentMonth + currentDay

        return result
    }

    function checkCurrentDate()
    {
        var daysCount = 31

        if( (monthList.currentIndex == 3) ||
            (monthList.currentIndex == 5) ||
            (monthList.currentIndex == 8) ||
            (monthList.currentIndex == 10) )
        {
            daysCount = 30
        }
        else if(monthList.currentIndex != 1)
        {
            daysCount = 31
        }
        else
        {
            if(yearList.currentIndex % 4 == 0)
            {
                 daysCount = 29
            }
            else
            {
                 daysCount = 28
            }
        }

        if(dayList.count < daysCount)
        {
            for(var i = dayList.count; i < daysCount; i++)
            {
                dayModel.append({"day": i+1})
            }
        }
        else if(dayList.count > daysCount)
        {
            for(var i = dayList.count; i > daysCount; i--)
            {
                dayModel.remove(i-1)
            }
        }
    }

    function scrollToToday()
    {
        var today = new Date()
        var year = today.getFullYear() - 2000
        var month = today.getMonth()
        var day = today.getDate()-1

        yearList.currentIndex = year
        monthList.currentIndex = month
        dayList.currentIndex = day
    }

    function scrollBackFromToday(daysCount)
    {
        var today = new Date()
        today.setDate(today.getDate()-daysCount)
        var year = today.getFullYear() - 2000
        var month = today.getMonth()
        var day = today.getDate()-1

        yearList.currentIndex = year
        monthList.currentIndex = month
        dayList.currentIndex = day
    }
}
