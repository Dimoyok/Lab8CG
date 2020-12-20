import QtQuick 2.2
Rectangle {
    property int sideBarWidth:220

    id: root
    width: extern_screenWidth
    height: extern_screenHeight
    color: "#1d1d1d"

   TR_Label
   {
       id: versionLabel
       width: 140
       height: 60

       anchors.bottom: parent.bottom
       anchors.right: parent.right
       text: "Лабораторная работа 8\nСтудента РК6-51Б\nЙокубаускаса Дмитрия"
       style: 11
   }

   Rectangle
   {
       id: sidebarFrame
       width: slider.value
       color: "#272727"
       anchors.top: parent.top
       anchors.bottom: parent.bottom
       anchors.left: parent.left

       TR_Label
       {
           id: sidebarLabel
           width: 140
           height: 60

           anchors.top: parent.up
           anchors.left: parent.left
           text: "sidebarFrame"
           style: 11
       }
   }

   Rectangle
   {
       id: sliderForm

       width: 280
       height: 70

       border.color: "#ffffff"
       border.width: 1
       color: "#1d1d1d"
       anchors
       {
           left: sidebarFrame.right
           top: parent.top
       }

       TR_Slider
       {
           id: slider
           anchors.centerIn: parent

           sliderWidth: 250

           minimum: 0
           maximum: 200
           value: 50
       }

       TR_Label
       {
           id: sliderLabel
           width: 140
           height: 60

           anchors.top: parent.up
           anchors.left: parent.left
           text: "Slider for changing width of sidebarFrame"
           style: 11
       }
   }

   Rectangle
   {
       id: changeableFrame
       anchors.top: sliderForm.bottom
       anchors.left: sidebarFrame.right
       width: sliderWidth.value
       height: sliderHeight.value

       color: "#42006f"

       border.color: "#ffffff"
       border.width: 1


       TR_Label
       {
           id: chFrameLabel
           width: 140
           height: 60

           anchors.top: parent.up
           anchors.left: parent.left
           text: "Changable frame"
           style: 11
       }
   }

   Rectangle
   {
       id: chSliderForm
       anchors
       {
           left: sidebarFrame.right
           top: changeableFrame.bottom
       }

       width: 280
       height: 90

       border.color: "#ffffff"
       border.width: 1
       color: "#1d1d1d"


       TR_Slider
       {
           id: sliderWidth

           y: parent.height/3 - height/2
           x: parent.width/2 - width/2

           minimum: 0
           maximum: 200

           sliderWidth: 250
           value: 50

       }

       TR_Label
       {
           id: chFrameWidthLabel
           width: 140
           height: 16

           anchors.bottom: sliderWidth.top
           anchors.left: parent.left
           text: "  Width:"
           style: 11
       }

       TR_Slider
       {
           id: sliderHeight

           y: 2 * parent.height/3 - height/2
           x: parent.width/2 - width/2

           minimum: 0
           maximum: 200

           sliderWidth: 250
           value: 50

       }

       TR_Label
       {
           id: chFrameHeightLabel
           width: 140
           height: 16

           anchors.bottom: sliderHeight.top
           anchors.left: parent.left
           text: "  Height:"
           style: 11
       }

   }

   Rectangle
   {
       id: sliderMinMax

       width: 280
       height: 70

       border.color: "#ffffff"
       border.width: 1
       color: "#1d1d1d"
       anchors
       {
           left: sidebarFrame.right
           top: chSliderForm.bottom
       }

       SliderMinMax
       {
           id: sliderMM

           anchors.centerIn: parent

           sliderWidth: 250

           minimum: 0
           maximum: 100
           minValue: 30
           maxValue: 70

           showCaption: true
       }

       TR_Label
       {
           id: sliderMMLabel
           width: 140
           height: 16

           anchors.bottom: sliderMM.top
           anchors.left: parent.left
           text: "SliderMinMax"
           style: 11
       }

   }
}
