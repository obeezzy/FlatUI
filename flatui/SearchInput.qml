import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."

Rectangle {
    id: root
    width: 150
    height: 20
    border.width: 2
    border.color: textField.activeFocus ? root.activeColor : root.defaultColor
    color: root.defaultColor
    radius: 4

    property color defaultColor: "#293A4A"
    property color activeColor: FlatUI.turquoise
    property color inactiveColor: "#4D5E72"
    property color selectedTextColor: "#7F96FF"

    Behavior on border.color { ColorAnimation { duration: 250 } }

    TextField {
        id: textField
        placeholderText: "Search"
        font.family: FlatUI.latoRegularFont.name
        font.pixelSize: 12
        anchors.left: parent.left
        anchors.right: iconRect.left
        anchors.margins: 2
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        style: TextFieldStyle {
            background: Rectangle {
                color: root.defaultColor
                radius: 4
            }

            placeholderTextColor: root.inactiveColor
            textColor: control.activeFocus ? root.activeColor : root.inactiveColor
            selectionColor: "white"
            selectedTextColor: root.selectedTextColor
        }
    }

    Rectangle {
        id: iconRect
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 2
        width: 30
        color: root.defaultColor
        border.color: area.pressed ? FlatUI.belize_hole : ""
        border.width: area.pressed ? 2 : 0

        Text {
            id: searchIcon
            font.family: FlatUI.glyphFont.name
            font.pixelSize: 12
            anchors.centerIn: parent
            text: FlatUI.glyphFont.search
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
            width: contentWidth
            height: contentHeight
            color: textField.activeFocus ? root.activeColor : root.inactiveColor

            Behavior on color { ColorAnimation { duration: 250 } }
        }

        MouseArea {
            id: area
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
        }
    }
}
