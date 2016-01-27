import QtQuick 2.4
import QtGraphicalEffects 1.0
import "."

Rectangle {
    id: root
    width: 216 /*buttonText.width + root.padding*/
    height: 47
    color: defaultColor
    radius: root.leftCornerCurved || root.rightCornerCurved ? defaultRadius : 6

    signal clicked

    property color defaultColor: FlatUI.turquoise;
    property color pressColor: FlatUI.greenSea;
    property color highlightColor: "#48c9b0";
    property color checkedColor: FlatUI.greenSea

    property string text: "Button"
    property color textColor: "white";
    property color textPressColor: textColor
    property color textHighlightColor: textColor
    property color textCheckedColor: textColor
    readonly property color disabledTextColor: "#EAECED";

    property int pointSize: 13;
    property int padding: 100
    property string fontFamily: FlatUI.latoRegularFont.name
    property bool bold: true
    readonly property int textWidth: buttonText.width
    readonly property int textHeight: buttonText.height
    property int textHorizontalOffset: 0
    property variant textHAlignment: Qt.AlignHCenter

    property bool leftCornerCurved: false
    property bool rightCornerCurved: false
    property bool checked: false
    readonly property int defaultRadius: 4

    readonly property bool hovered: root.state == "HOVERED"
    readonly property bool pressed: root.state == "PRESSED"

    Rectangle {
        id: disabledCover
        anchors.fill: parent
        visible: !root.enabled
        radius: parent.radius
        color: disabledCoverColor

        readonly property color disabledCoverColor: "#D1D5D8"
    }

    Text {
        id: buttonText
        text: root.text

        anchors.centerIn: root.textHAlignment == Qt.AlignHCenter ? parent : undefined
        anchors.left: root.textHAlignment == Qt.AlignLeft ? parent.left : undefined
        anchors.right: root.textHAlignment == Qt.AlignRight ? parent.right : undefined
        anchors.verticalCenter: root.textHAlignment == Qt.AlignLeft || root.textHAlignment == Qt.AlignRight ? parent.verticalCenter : undefined
        anchors.margins: 10

        anchors.horizontalCenterOffset: root.textHorizontalOffset
        font.family: root.fontFamily
        font.pointSize: root.pointSize
        font.bold: root.bold
        color: {
            if(!root.enabled)
                root.disabledTextColor
            else if(root.pressed)
                root.textPressColor
            else if(root.hovered)
                root.textHighlightColor
            else if(root.checked)
                root.textCheckedColor
            else
                root.textColor
        }
        width: contentWidth
        height: contentHeight

        Behavior on color { ColorAnimation {}}
    }

    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        preventStealing: true

        onClicked: root.clicked()
    }

//    Rectangle {
//        id: leftEdge
//        anchors.left: parent.right
//        anchors.leftMargin: -2
//        color: "red"
//        anchors.top: parent.top
//        anchors.bottom: parent.bottom
//        width: root.leftCornerCurved ? 2 : 0
//        visible: !root.leftCornerCurved
//        smooth: true
//        z: visible ? 0 : -2
//    }

//    Rectangle {
//        anchors.right: parent.left
//        anchors.rightMargin: -2
//        color: parent.color
//        anchors.top: parent.top
//        anchors.bottom: parent.bottom
//        width: 2
//        visible: !root.rightCornerCurved
//        smooth: true
//        z: visible ? 0 : -2
//    }

//    state: {
//        if(!enabled)
//            ""
//        else if(root.checked)
//            "CHECKED"
//        else if(area.pressed)
//            "PRESSED"
//        else if(area.containsMouse)
//            "HOVERED"
//        else
//            ""
//    }

    states: [
        State {
            name: ""
            when: !root.enabled
            PropertyChanges {
                target: root
                color: root.defaultColor
            }
        },

        State {
            name: "HOVERED"
            when: area.containsMouse && !area.pressed
            PropertyChanges {
                target: root
                color: root.highlightColor
            }
        },

        State {
            name: "PRESSED"
            when: area.pressed
            PropertyChanges {
                target: root
                color: root.pressColor
            }
        },

        State {
            name: "CHECKED"
            when: root.checked
            PropertyChanges {
                target: root
                color: root.checkedColor
            }
        }
    ]

    transitions: Transition {ColorAnimation { duration: 250 } }

    Component.onCompleted: root.defaultColor = root.color
}

