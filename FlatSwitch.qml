import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    width: 80
    height: 30
    radius: 20
    clip: true
    smooth: true
    color: handleArea.checked ? flatConstants.asbestos : flatConstants.midnightBlue

    property string onText: "ON"
    property string offText: "OFF"
    property string fontFamily: flatConstants.latoBoldFont.name
    property int pointSize: 12
    property int handleRadius: handle.width
    property int handleBorderWidth: 2
    property int handleWidth: 22
    property int handleOffset: 4
    property bool offRegionFlat: false
    property bool onRegionFlat: false
    property bool offsetsUsed: true

    property bool checked: false

    FlatConstants {
        id: flatConstants
    }

    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        color: Qt.rgba(.9, .9, .9, .6)
        visible: !parent.enabled
        z: 10
    }

//    OpacityMask {
//        id: mask
//        anchors.fill: parent
//        source: onBackground
//        maskSource: offBackground
//    }

    Rectangle {
        id: offBackground
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        x: root.offsetsUsed ? offBackground.offsetWhenShown : handle.x
        width: parent.width
        radius: parent.radius
        color: flatConstants.concrete
        smooth: true
        z: root.checked ? 0 : 1

        readonly property int offsetWhenHidden: handle.x + 30
        readonly property int offsetWhenShown: handle.x - 4

        Rectangle {
            id: offEdge
            width: 4
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: -1
            visible: root.offRegionFlat
            color: parent.color
        }

        // OFF TEXT AREA
        Text {
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: 8
            color: "white" /*turquoise*/
            text: root.offText
            font.family: root.fontFamily
            font.pointSize: root.pointSize
        }

        MouseArea {
            id: offBackgroundArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                root.checked = true
            }
        }

        states: [
            State {
                name: ""
                when: !handleArea.checked && handle.atStart
                PropertyChanges {
                    target: offBackground
                    x: root.offsetsUsed ? offBackground.offsetWhenShown : handle.x
                }
            },

            State {
                name: "CHECKED"
                when: handle.atEnd && handleArea.checked
                PropertyChanges {
                    target: offBackground
                    x: root.offsetsUsed ? offBackground.offsetWhenHidden : 0
                }
            }
        ]

        Behavior on x {
            enabled: (!handleArea.checked && handle.atStart) || (handle.atEnd && handleArea.checked)

            NumberAnimation {duration: 250}
        }
    }

    Rectangle {
        id: onBackground
        x: root.offsetsUsed ? onBackground.offsetWhenHidden : 0
        width: offBackground.width
        height: offBackground.height
        color: flatConstants.midnightBlue
        radius: offBackground.radius
        smooth: true
        z: root.checked ? 1 : 0

        readonly property int offsetWhenHidden: handle.x - onBackground.width - 4
        readonly property int offsetWhenShown: handle.x - onBackground.width + handle.width + 4
        readonly property int shiftMargin: handle.x - onBackground.width + 18

        Rectangle {
            id: onEdge
            width: 4
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: -1
            visible: root.onRegionFlat
            color: parent.color
        }

        // ON TEXT AREA
        Text {
            anchors.right: parent.right
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -8
            color: flatConstants.turquoise
            text: root.onText
            font.family: root.fontFamily
            font.pointSize: root.pointSize
        }

        MouseArea {
            id: onBackgroundArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            onClicked: root.checked = false
        }

        states: [
            State {
                name: ""
                when: !handleArea.checked && handle.atStart
                PropertyChanges {
                    target: onBackground
                    x: onBackground.offsetWhenHidden
                }
            },

            State {
                name: "SHIFTED"
                when: !handleArea.checked && !handle.atStart
                PropertyChanges {
                    target: onBackground
                    x: onBackground.shiftMargin
                }
            },

            State {
                name: "CHECKED"
                when: !handle.atStart && handleArea.checked
                PropertyChanges {
                    target: onBackground
                    x: root.offsetsUsed ? onBackground.offsetWhenShown : handle.x - onBackground.width + handle.width
                }
            }
        ]

       Behavior on x {
           enabled: (!handleArea.checked && handle.atStart) || (handle.atEnd && handleArea.checked)
           NumberAnimation { duration: 250 }
       }

        onStateChanged: {
            switch(state) {
            case "":
                handle.color = flatConstants.asbestos
                break
            case "CHECKED":
                handle.color = flatConstants.turquoise
                break
            }
        }
    }

    Rectangle {
        id: handle
        x: 0
        anchors.verticalCenter: parent.verticalCenter
        width: root.handleWidth
        height: width
        radius: root.handleRadius
        color: handleArea.checked ? flatConstants.turquoise : flatConstants.asbestos  /*turquoise*/
        border.width: root.handleBorderWidth
        border.color: "transparent"
        z: 5

        readonly property int startX: root.handleOffset
        readonly property int endX: offBackground.width - handle.width - root.handleOffset
        readonly property bool atStart: handle.x == handle.startX
        readonly property bool atEnd: handle.x == handle.endX

        Behavior on x { NumberAnimation {duration: 150} }
        Behavior on color { ColorAnimation {duration: 150} }

        // This sets the handle to the correct position if the switch is checked.
        onEndXChanged: {
            if(root.checked)
                handle.x = handle.endX
        }


        MouseArea {
            id: handleArea
            anchors.fill: parent
            drag.target: handle
            drag.axis: Drag.XAxis
            drag.minimumX: handle.startX
            drag.maximumX: handle.endX
            drag.threshold: 1
            cursorShape: Qt.PointingHandCursor

            readonly property bool checked: root.checked

            function shiftLeft() {
                handle.x = handle.startX
                root.checked = false
            }

            function shiftRight() {
                handle.x = handle.endX
                root.checked = true
            }

            onClicked: {
                root.checked = !root.checked
            }

            onReleased: {
                if(!handle.checked && handle.x >= offBackground.width / 3)
                    shiftRight()
                else if(!handle.checked && handle.x < offBackground.width / 3)
                    shiftLeft()
                else if(handle.checked && handle.x <= offBackground.width * 2 / 3)
                    shiftLeft()
                else
                    shiftRight()
            }



            onCheckedChanged: {
                if(checked)
                    shiftRight()
                else
                    shiftLeft()
            }
        }
    }
 }
