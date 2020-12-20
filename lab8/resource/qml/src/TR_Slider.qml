import QtQuick 2.2

// NOTE: add mouse position setting in discrete mode

Item
{
    id: root;

    //use this params instead of common width|height to set geomtry
    property int sliderWidth: 280
    property int sliderHeight: 11
    property int captionWidth: 40 + 4 * captionPrecision
    property int captionHeight: 13
    property int captionSpacing: 5
    ///////////////////////////////

    property int captionPrecision: 2
    property int captionPrecisionPow10: Math.pow(10, captionPrecision)

    property alias minimum: slider.minimum
    property alias maximum: slider.maximum

    property alias value:   slider.value

    property alias discrete: slider.discrete
    property real step: 1
    property alias discretePartLength: slider.discretePartLength

    property bool showCaption: false;
    property bool captionInDegrees: false;

    //exponential slider
    property real   exponentialPixelPart: 0
    property real   exponentialMaxValue: 300
    ///////////////////////////////

    property alias sliderColor: leftRect.color

    property bool selected: false
    property bool selectionAllowed: false

    property color handleSelectedColor:     "#f3b200"
    property color handleUnselectedColor:   "#ffffff"

    signal signSelected();
    signal signPositionChanged()

    width:  showCaption ? sliderWidth + captionWidth : sliderWidth;
    height: showCaption ? sliderHeight + captionHeight + captionSpacing : sliderHeight;

    TR_Label {
        id: caption
        width: parent.captionWidth
        height: parent.captionHeight
        anchors.top: slider.bottom
        anchors.topMargin: captionSpacing
        x: handle.x + sliderHeight / 2
        text:  getText()
        horizontalAlignment: 4
        verticalAlignment: 1
        style: 11
        opacity: root.showCaption
    }

    function getText()
    {
        if(captionInDegrees)
        {
            var degrees = Math.floor(slider.value)
            var minutes = (slider.value - degrees) * 60.0
            var seconds = Math.floor((minutes - Math.floor(minutes)) * 60.0)

            return  degrees + "°" + Math.floor(minutes) + "\'"  + seconds + "\""
        }
        else
           return slider.value
    }

    function setSliderParams(setMin, setMax)
    {
        slider.minimum = setMin
        slider.maximum = setMax

        if (setMax > setMin) {
            if(slider.value < slider.minimum)
            {
                setValue(slider.minimum)
                return;
            }
            if(slider.value > slider.maximum)
            {
                setValue(slider.maximum)
                return;
            }
            var pos = 2 + (slider.value - setMin) * slider.xMax / (setMax - setMin);
            pos = Math.min(pos, width - handle.width - 2);
            pos = Math.max(pos, 2);
            handle.x = pos;
            console.debug(handle.x, "setSliderParams1")
        } else {
            handle.x = slider.xMax + 2;
            setValue(Math.max(setMin, setMax));
            console.debug(handle.x, "setSliderParams2")
        }
    }

    function setValue(val)
    {
        if(val < slider.minimum)
        {
            slider.value = slider.minimum
            slider.updatePos()
            return;
        }
        if(val > slider.maximum)
        {
            slider.value = slider.maximum
            slider.updatePos()
            return;
        }
        slider.value = Math.floor(val * root.captionPrecisionPow10) / root.captionPrecisionPow10; //can be precision loosing after * operation :(
        slider.updatePos()

        //console.debug("setValue")
    }

    Item {
        id: slider;
        width: sliderWidth; height: sliderHeight

        anchors
        {
            centerIn: parent
        }

        // value is read/write.
        property real value: 1
        //onValueChanged: setValue(value) //updatePos();
        property real maximum: 1
        property real minimum: 1
        property int xMax: width - handle.width - 4
        property bool discrete: false
        property real discretePartLength: step ? xMax / ((maximum-minimum) / step) : 1
        onXMaxChanged: updatePos();
        //onMinimumChanged: updatePos();
        //onMaximumChanged: updatePos();

        function updatePos() {
            if (slider.maximum > slider.minimum)
            {
                var pos = 0

                if(exponentialPixelPart)
                {
                    if(slider.value < exponentialMaxValue)
                        pos = 2 + Math.pow((slider.value - slider.minimum) / exponentialMaxValue, 0.769) * (slider.xMax * exponentialPixelPart);
                    else
                        pos = 2 + slider.xMax * exponentialPixelPart + (slider.value - exponentialMaxValue) * (slider.xMax * (1 - exponentialPixelPart)) / (slider.maximum - exponentialMaxValue);
                }
                else
                {
                    pos = 2 + (slider.value - slider.minimum) * slider.xMax / (slider.maximum - slider.minimum);
                }

                pos = Math.min(pos, width - handle.width - 2);
                pos = Math.max(pos, 2);
                handle.x = pos;
                //console.debug(handle.x, "updatepos1")
            }
            else
            {
                handle.x = xMax + 2;
                //console.debug(handle.x, "updatepos2")
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "#6c6c6c"

            MouseArea {
                id: backgroundMouseArea

                anchors.fill: parent
                onClicked:
                    if(slider.minimum != slider.maximum)
                    {
                        handle.x = Math.min(Math.max(2, mouseX - handle.width / 2), slider.xMax + 2)
                        handleMouseArea.positionChanged(Qt.LeftButton)
                    }
            }
        }

        Rectangle {
            id: leftRect;
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: handle.left
            color: "#008287"
        }

        Rectangle {
            id: handle;
            width: slider.height; height: slider.height;
            color: selected ? handleSelectedColor : handleUnselectedColor

            MouseArea {
                id: handleMouseArea
                anchors.fill: parent; drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: slider.maximum > slider.minimum ? 2 : slider.xMax + 2
                drag.maximumX: slider.xMax + 2
                onPositionChanged:
                {
                    if(exponentialPixelPart)
                    {
                        if(handle.x-2 < exponentialPixelPart * slider.xMax)
                            slider.value = slider.minimum + exponentialMaxValue * ( Math.pow(((handle.x-2) / (exponentialPixelPart * slider.xMax)), 1.3) );
                        else
                            slider.value = exponentialMaxValue + (slider.maximum - exponentialMaxValue) * (handle.x - 2 - slider.xMax * exponentialPixelPart) / (slider.xMax * (1 - exponentialPixelPart));
                    }
                    else
                    {
                        if(discrete)
                        {
                            handle.x = Math.ceil((handle.x-2) / slider.discretePartLength) * slider.discretePartLength + 2;
                        }

                        slider.value = (slider.maximum - slider.minimum) * (handle.x - 2) / slider.xMax + slider.minimum;
                    }
                    slider.value = Math.floor(slider.value * root.captionPrecisionPow10) / root.captionPrecisionPow10; //can be precision loosing after * operation :(
                    signPositionChanged()
                }

                onPressed:
                {
                    if(selectionAllowed && !root.selected)
                    {
                        root.selected = true;
                        root.signSelected();
                    }
                }
            }
        }
    }
}
