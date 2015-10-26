import QtQuick 2.4

Rectangle {
    id: root
    width: row.width
    height: 45
    color: root.defaultColor
    radius: 6

    property color defaultColor: flatConstants.midnightBlue
    property int padding: 40
    property string text: "All messages"

    FlatConstants {
        id: flatConstants
    }

    Row {
        id: row
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        FlatButton {
            id: backButton
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            leftCornerCurved: true
            rightCornerCurved: true
            radius: root.radius
            color: flatConstants.wetAsphalt
            pressColor: root.defaultColor
            highlightColor: root.defaultColor
            text: flatConstants.glyphFont.leftStickArrow + " " + root.text
            padding: 20
            fontFamily: flatConstants.glyphFont.name
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
            text: flatConstants.glyphFont.rightStickArrow
            color: flatConstants.wetAsphalt
            pressColor: root.defaultColor
            highlightColor: root.defaultColor
            leftCornerCurved: false
            rightCornerCurved: true
            radius: root.radius
        }
    }
}

