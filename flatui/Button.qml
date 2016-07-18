import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.0 as QQControls
import "."

QQControls.Button {
    id: root
    text: qsTr("Button")

    font {
        family: FlatUI.latoRegularFont.name
        pixelSize: 16
        bold: true
    }

    readonly property alias style: style

    ButtonStyle {
        id: style
        __focused: root.activeFocus
        __hovered: area.containsMouse || root.activeFocus
        __pressed: area.pressed || root.down
        enabled: root.enabled

        icon.font.pixelSize: root.font.pixelSize
    }

    background: Rectangle {
        implicitWidth: 216
        implicitHeight: 47
        radius: style.radius
        color: style.color

        MouseArea {
            id: area
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                root.focus = true
                root.clicked()
            }

            onDoubleClicked: root.doubleClicked()
            onPressAndHold: root.pressAndHold()
            onReleased: root.released()
        }
    }

    contentItem: Item {
        Row {
            anchors.centerIn: parent
            spacing: 8

            Text {
                id: iconText
                text: style.icon.text
                font: style.icon.font
                color: style.icon.color
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: contentWidth
                height: contentHeight
            }

            Text {
                text: root.text
                font: root.font
                color: style.textColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
    }
}

