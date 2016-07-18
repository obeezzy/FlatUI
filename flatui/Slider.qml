import QtQuick 2.3
import QtQuick.Controls 2.0 as QQControls
import "."

QQControls.Slider {
    id: root

    property alias style: style

    SliderStyle {
        id: style
        name: "primary"
        radius: handle.implicitWidth / 2

        //__hovered: area.containsMouse
        __focused: root.activeFocus

    }

    background: Rectangle {
        x: root.leftPadding
        y: root.topPadding + root.availableHeight / 2 - height / 2
        implicitWidth: 200
        implicitHeight: 12
        width: root.availableWidth
        height: implicitHeight
        radius: 12
        color: style.grooveColor

        Rectangle {
          width: root.visualPosition * parent.width
          height: parent.height
          color: style.progressColor
          radius: 12
        }
    }

    handle: Rectangle {
        x: root.leftPadding + root.visualPosition * (root.availableWidth - width)
        y: root.topPadding + root.availableHeight / 2 - height / 2
        color: style.color
        radius: width / 2
        implicitWidth: 20
        implicitHeight: implicitWidth

//        MouseArea {
//            anchors.fill: parent
//            cursorShape: Qt.PointingHandCursor
//            hoverEnabled: true

//        }
    }
}
