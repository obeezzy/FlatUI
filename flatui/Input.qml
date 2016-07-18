import QtQuick 2.7
import QtQuick.Controls 2.0 as QQControls
import "."

QQControls.TextField {
    id: root
    placeholderText: qsTr("Inactive")
    leftPadding: style.leftPadding
    rightPadding: style.rightPadding
    selectionColor: style.borderColor
    selectedTextColor: "white"
    color: style.textColor

    font {
        family: FlatUI.latoRegularFont.name
        pixelSize: 16
    }

    readonly property alias style: style

    InputStyle {
        id: style
        __focused: root.activeFocus
        enabled: root.enabled

        icon.font.pixelSize: root.font.pixelSize
    }

    background: Rectangle {
        implicitWidth: 215
        implicitHeight: 47
        color: style.color
        border.color: style.borderColor
        border.width: style.borderWidth
        radius: style.radius

        Text {
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: style.rightPadding + 4
            verticalAlignment: Qt.AlignVCenter
            font.family: style.icon.font.family
            font.pixelSize: style.icon.font.pixelSize
            text: style.icon.text
            color: style.icon.color
        }
    }
}
