import QtQuick 2.2

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

    property alias minValue:   slider.minValue
    property alias maxValue:   slider.maxValue

    property alias discrete: slider.discrete
    property real step: 1
    property alias discretePartLength: slider.discretePartLength

    property bool showCaption: false;

    //exponential slider
    property real   exponentialPixelPart: 0
    property real   exponentialMaxValue: 300
    ///////////////////////////////

    property alias sliderColor: middleRect.color

    property bool selected: false
    property bool selectionAllowed: false

    property color handleSelectedColor:     "#f3b200"
    property color handleUnselectedColor:   "#ffffff"

    signal signSelected();
    signal signPositionChanged()

    width:  showCaption ? sliderWidth + captionWidth : sliderWidth;
    height: showCaption ? sliderHeight + captionHeight + captionSpacing : sliderHeight;

    TR_Label {
        id: captionMin
        width: parent.captionWidth
        height: parent.captionHeight
        anchors.top: slider.bottom
        anchors.topMargin: captionSpacing
        x: minHandle.x + sliderHeight / 2
        text:  slider.minValue
        horizontalAlignment: 4
        verticalAlignment: 1
        style: 11
        opacity: root.showCaption
    }

    TR_Label {
        id: captionMax
        width: parent.captionWidth
        height: parent.captionHeight
        anchors.bottom: slider.top
        anchors.topMargin: captionSpacing
        x: maxHandle.x + sliderHeight / 2
        text:  slider.maxValue
        horizontalAlignment: 4
        verticalAlignment: 1
        style: 11
        opacity: root.showCaption
    }

    function setSliderParams(setMin, setMax)
    {

        if (setMax > setMin) {
            slider.minimum = setMin
            slider.maximum = setMax
        } else if (setMax === setMin){
            slider.minimum = setMin - step
            slider.maximum = setMax
        } else {
            slider.minimum = setMax
            slider.maximum = setMin
        }
    }

    function setMinValue(val)
    {
        if(val < slider.minimum)
        {
            slider.minValue = slider.minimum
            slider.updatePos()
            return;
        }
        if(val >= slider.maxValue)
        {
            slider.minValue = slider.maxValue-step
            slider.updatePos()
            return;
        }
        slider.minValue = Math.floor(val * root.captionPrecisionPow10) / root.captionPrecisionPow10; //can be precision loosing after * operation :(
        slider.updatePos()

        //console.debug("setValue")
    }

    function setMaxValue(val)
    {
        if(val <= slider.minValue)
        {
            slider.maxValue = slider.minValue-step
            slider.updatePos()
            return;
        }
        if(val > slider.maximum)
        {
            slider.maxValue = slider.maxValue
            slider.updatePos()
            return;
        }
        slider.maxValue = Math.floor(val * root.captionPrecisionPow10) / root.captionPrecisionPow10; //can be precision loosing after * operation :(
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
        property real minValue: 1
        property real maxValue: 1
        //onValueChanged: setValue(value) //updatePos();
        property real maximum: 1
        property real minimum: 1
        property int xMax: width - slider.height - 4
        property bool discrete: false
        property real discretePartLength: step ? xMax / ((maximum-minimum) / step) : 1
        onXMaxChanged: updatePos();
        //onMinimumChanged: updatePos();
        //onMaximumChanged: updatePos();

        function updatePos() {
            if (slider.maximum > slider.minimum)
            {
                var mipos = 0
                var mapos = 0

                if(exponentialPixelPart)
                {
                    if(slider.minValue < exponentialMaxValue)
                        mipos = 2 + Math.pow((slider.minValue - slider.minimum) / exponentialMaxValue, 0.769) * (slider.xMax * exponentialPixelPart);
                    else
                        mipos = 2 + slider.xMax * exponentialPixelPart + (slider.minValue - exponentialMaxValue) * (slider.xMax * (1 - exponentialPixelPart)) / (slider.maximum - exponentialMaxValue);

                    if(slider.maxValue < exponentialMaxValue)
                        mapos = 2 + Math.pow((slider.maxValue - slider.minimum) / exponentialMaxValue, 0.769) * (slider.xMax * exponentialPixelPart);
                    else
                        mapos = 2 + slider.xMax * exponentialPixelPart + (slider.maxValue - exponentialMaxValue) * (slider.xMax * (1 - exponentialPixelPart)) / (slider.maximum - exponentialMaxValue);
                }
                else
                {
                    mipos = 2 + (slider.minValue - slider.minimum) * slider.xMax / (slider.maximum - slider.minimum);
                    mapos = 2 + (slider.maxValue - slider.minimum) * slider.xMax / (slider.maximum - slider.minimum);
                }

                mipos = Math.min(mipos, width - slider.height - 2);
                mipos = Math.max(mipos, 2);
                mapos = Math.min(mapos, width - slider.height - 2);
                mapos = Math.max(mapos, 2);
                minHandle.x = mipos;
                maxHandle.x = mapos;
                //console.debug(handle.x, "updatepos1")
            }
            else
            {
                minHandle.x = xMax + 2;
                maxHandle.x = xMax + 2;
                //console.debug(handle.x, "updatepos2")
            }
        }

        Rectangle {
            id: middleRect;
            anchors.right: maxHandle.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: minHandle.right
            color: "#008287"
        }

        Rectangle {
            id: minHandle;
            width: slider.height; height: slider.height;
            color: selected ? handleSelectedColor : handleUnselectedColor

            MouseArea {
                id: handleMinMouseArea
                anchors.fill: parent; drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: 2
                drag.maximumX: maxHandle.x - maxHandle.width - 2
                onPositionChanged:
                {
                    if(exponentialPixelPart)
                    {
                        if(minHandle.x-2 < exponentialPixelPart * slider.xMax)
                            slider.minValue = slider.minimum + exponentialMaxValue * ( Math.pow(((minHandle.x-2) / (exponentialPixelPart * slider.xMax)), 1.3) );
                        else
                            slider.minValue = exponentialMaxValue + (slider.maximum - exponentialMaxValue) * (minHandle.x - 2 - slider.xMax * exponentialPixelPart) / (slider.xMax * (1 - exponentialPixelPart));
                    }
                    else
                    {
                        if(discrete)
                        {
                            minHandle.x = Math.ceil((minHandle.x-2) / slider.discretePartLength) * slider.discretePartLength + 2;
                        }

                        slider.minValue = (slider.maximum - slider.minimum) * (minHandle.x - 2) / slider.xMax + slider.minimum;
                    }
                    slider.minValue = Math.floor(slider.minValue * root.captionPrecisionPow10) / root.captionPrecisionPow10; //can be precision loosing after * operation :(
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

        Rectangle {
            id: maxHandle;
            width: slider.height; height: slider.height;
            color: selected ? handleSelectedColor : handleUnselectedColor

            MouseArea {
                id: handleMaxMouseArea
                anchors.fill: parent; drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: minHandle.x + minHandle.width + 2
                drag.maximumX: slider.xMax + 2
                onPositionChanged:
                {
                    if(exponentialPixelPart)
                    {
                        if(maxHandle.x-2 < exponentialPixelPart * slider.xMax)
                            slider.maxValue = slider.minimum + exponentialMaxValue * ( Math.pow(((maxHandle.x-2) / (exponentialPixelPart * slider.xMax)), 1.3) );
                        else
                            slider.maxValue = exponentialMaxValue + (slider.maximum - exponentialMaxValue) * (maxHandle.x - 2 - slider.xMax * exponentialPixelPart) / (slider.xMax * (1 - exponentialPixelPart));
                    }
                    else
                    {
                        if(discrete)
                        {
                            maxHandle.x = Math.ceil((maxHandle.x-2) / slider.discretePartLength) * slider.discretePartLength + 2;
                        }

                        slider.maxValue = (slider.maximum - slider.minimum) * (maxHandle.x - 2) / slider.xMax + slider.minimum;
                    }
                    slider.maxValue = Math.floor(slider.maxValue * root.captionPrecisionPow10) / root.captionPrecisionPow10; //can be precision loosing after * operation :(
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

