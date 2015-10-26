import QtQuick 2.4
import QtQuick.Controls 1.2

FlatDropdown {
    id: root

    dropdownColor: flatConstants.wetAsphalt
    dropdownHighlightColor: flatConstants.turquoise
    dropdownTextColor: "white"

    color: flatConstants.wetAsphalt
    highlightColor: root.defaultColor
    pressColor: root.defaultColor
    checkedColor: root.defaultColor

    text: "Flat UI"
    textColor: "white"
    textHighlightColor: flatConstants.turquoise
    textPressColor: textHighlightColor
    textCheckedColor: textHighlightColor
    pointSize: 12
    z: flatConstants.dropdownZ

    property bool indicatorVisible: false
    property color indicatorColor: flatConstants.turquoise

    Rectangle {
        id: indicator
//        x: root.width / 2 + root.textWidth / 2 + 2
//        y: root.height / 2 - root.textHeight / 2 - 2
        width: 5
        height: width
        radius: width / 2
        color: root.indicatorColor
        visible: root.indicatorVisible
        z: 2
    }

    Component.onCompleted: parent.z = root.z
}

