import QtQuick 2.4
import "."

FlatButton {
    id: root
    width: root.textWidth + root.padding
    padding: 40
    color: FlatUI.wetAsphalt
    highlightColor: root.defaultColor
    pressColor: root.defaultColor
    checkedColor: root.defaultColor

    text: "Flat UI"
    textColor: "white"
    textHighlightColor: FlatUI.turquoise
    textPressColor: textHighlightColor
    textCheckedColor: textHighlightColor
    pointSize: 12 // 18

    property bool indicatorVisible: false
    property color indicatorColor: FlatUI.turquoise
    property bool active: checked

    Rectangle {
        id: indicator
        x: root.width / 2 + root.textWidth / 2 + 2
        y: root.height / 2 - root.textHeight / 2 - 2
        width: 6
        height: width
        radius: width / 2
        color: root.indicatorColor
        visible: root.indicatorVisible
        z: 2
    }

    onClicked: root.checked = !root.checked
}
