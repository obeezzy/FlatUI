import QtQuick 2.4
import "."

Rectangle {
    id: root
    width: 500
    height: 55
    radius: 6
    color: FlatUI.wetAsphalt

    property bool searchBarVisible: false   

    FlatSearchInput {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 15
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        width: 250
        visible: root.searchBarVisible
    }
}

