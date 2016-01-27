import QtQuick 2.4
import "."

Rectangle {
    id: root
    width: row.width
    height: 45
    color: root.defaultColor
    radius: 6

    property color defaultColor: FlatUI.midnightBlue
    property int padding: 40
    property string text: "All messages"

    Row {
        id: row
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        FlatButton {
            id: backButton
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            //leftCornerCurved: true
            //rightCornerCurved: true
            radius: root.radius
            color: FlatUI.wetAsphalt
            pressColor: root.defaultColor
            highlightColor: root.defaultColor
            text: FlatUI.glyphFont.leftStickArrow + " " + root.text
            padding: 20
            fontFamily: FlatUI.glyphFont.name
        }

        Rectangle {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 2
            color: root.defaultColor
        }

        FlatIconButton {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 40
            text: FlatUI.glyphFont.rightStickArrow
            color: FlatUI.wetAsphalt
            pressColor: root.defaultColor
            highlightColor: root.defaultColor
            //leftCornerCurved: false
            //rightCornerCurved: true
            radius: root.radius
        }
    }
}

