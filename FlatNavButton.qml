import QtQuick 2.4

FlatButton {
    id: root
    width: root.textWidth + root.padding
    padding: 40
    color: flatConstants.wetAsphalt
    highlightColor: root.defaultColor
    pressColor: root.defaultColor
    checkedColor: root.defaultColor

    text: "Flat UI"
    textColor: "white"
    textHighlightColor: flatConstants.turquoise
    textPressColor: textHighlightColor
    textCheckedColor: textHighlightColor
    pointSize: 12 // 18

    property bool indicatorVisible: false
    property color indicatorColor: flatConstants.turquoise
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
