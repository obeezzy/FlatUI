import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.0 as QQControls
import "."

QQControls.Switch {
    id: root
    text: qsTr("Switch")

    font {
        family: FlatUI.latoRegularFont.name
        pixelSize: 14
        bold: true
    }

    property alias style: style

    SwitchStyle {
        id: style
        radius: indicator.implicitHeight
    }

    indicator: Item {
        implicitWidth: 80
        implicitHeight: 30

        // The content to be displayed
        Rectangle {
            id: indicatorContent
            anchors.fill: parent
            visible: false // to make the mask show
            radius: style.radius
            color: offPortion.color

            // Off portion
            Rectangle {
                id: offPortion
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: parent.width
                color: style.offColor
            }

            Text {
                id: offText
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: handle.right
                anchors.leftMargin: 10
                font: root.font
                text: style.offText
                color: style.offTextColor
            }

            // On portion
            Rectangle {
                id: onPortion
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: offPortion.left
                anchors.left: undefined
                width: parent.width
                color: style.onColor
            }

            // ON text
            Text {
                id: onText
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: handle.left
                anchors.rightMargin: 10
                text: style.onText
                color: style.onTextColor
                font: root.font
            }

            Rectangle {
                id: handle
                anchors.left: parent.left
                anchors.leftMargin: 6
                anchors.rightMargin: 6
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height - 8
                width: height
                radius: width / 2
                color: root.checked ? style.handleOnColor : style.handleOffColor

                Behavior on color {ColorAnimation {} }
            }

            states: [
                State {
                    when: !root.checked
                    name: ""

                    AnchorChanges {
                        target: offPortion
                        anchors.left: indicatorContent.left
                        anchors.right: indicatorContent.right
                    }

                    AnchorChanges {
                        target: onPortion
                        anchors.left: undefined
                        anchors.right: offPortion.left
                    }

                    AnchorChanges {
                        target: handle
                        anchors.left: indicatorContent.left
                        anchors.right: undefined
                    }

                    PropertyChanges {
                        target: handle
                        color: style.handleOffColor
                    }
                },

                State {
                    name: "ON"
                    when: root.checked

                    AnchorChanges {
                        target: offPortion
                        anchors.left: onPortion.right
                        anchors.right: undefined
                    }

                    AnchorChanges {
                        target: onPortion
                        anchors.left: indicatorContent.left
                        anchors.right: indicatorContent.right
                    }

                    AnchorChanges {
                        target: handle
                        anchors.left: undefined
                        anchors.right: indicatorContent.right
                    }

                    PropertyChanges {
                        target: handle
                        color: style.handleOnColor
                    }
                }
            ]

            transitions: [
                Transition {
                    AnchorAnimation { duration: 250 }
                }
            ]
        }

        // Mask that provides the rounded edges
        Rectangle {
            id: mask
            x: indicatorContent.x
            y: indicatorContent.y
            width: indicatorContent.width
            height: indicatorContent.height
            color: "black"
            radius: indicatorContent.radius
            clip: true
            visible: false // to make the mask show
            opacity: opacityMask.opacity
        }

        // Object that does the actual masking
        OpacityMask {
            id: opacityMask
            anchors.fill: mask
            source: indicatorContent
            maskSource: mask
            opacity: indicator.opacity
            z: parent.z - 1
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: root.checked = !root.checked
        }
    }

    contentItem: Item {}
}
