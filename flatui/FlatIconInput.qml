import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."

Rectangle {
    id: root
    height: 47;
    width: 215;
    border.width: 2
    border.color: textField.activeFocus ? root.activeBorderColor : root.inactiveBorderColor
    color: "white"
    radius: 4

    property color activeBorderColor: FlatUI.turquoise
    property color inactiveBorderColor: FlatUI.silver
    property color activeTextColor: FlatUI.midnightBlue
    property color inactiveTextColor: root.activeTextColor
    property color selectionColor: "white"
    property color selectedTextColor: "#7F96FF"
    property color backgroundColor: !root.enabled ? "#f7f9f9" : "white";
    property int pointSize: 11;
    property bool error: false;
    property bool success: false;
    property string iconText: FlatUI.glyphFont.search
    property string fontFamily: FlatUI.glyphFont.name
    property string placeholderText: "Input"
    property color placeholderTextColor: FlatUI.silver
    property string text: ""
    property alias echoMode: textField.echoMode

    Behavior on border.color { ColorAnimation {} }

    TextField {
        id: textField
        placeholderText: root.placeholderText
        text: root.text
        font.family: FlatUI.latoRegularFont.name
        font.pointSize: root.pointSize
        anchors.left: parent.left
        anchors.right: iconRect.left
        anchors.margins: 2
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        style: TextFieldStyle {
            background: Rectangle {
                color: root.color
                radius: 4
            }

            placeholderTextColor: root.placeholderTextColor
            textColor: control.activeFocus ? root.activeTextColor : root.inactiveTextColor
            selectionColor: root.selectionColor
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
        color: "white"
        border.color: area.pressed ? FlatUI.belize_hole : ""
        border.width: area.pressed ? 2 : 0

        Text {
            id: icon
            font.family: root.fontFamily
            font.pointSize: 12
            anchors.centerIn: parent
            text: root.iconText
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
            width: contentWidth
            height: contentHeight
            color: root.border.color

            //Behavior on color { ColorAnimation {} }
        }

        MouseArea {
            id: area
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
        }
    }

    onEnabledChanged: {
        if (!root.enabled) {
            textField.borderColor = "#e1e6e6";
            textField.textColor = "#e1e6e6";
        }

        else
            textField.textColor = "black";
    }

    onSuccessChanged: {
        if (success) {
            textField.textColor = FlatUI.emerald;
            textField.borderColor = FlatUI.emerald;
        }

        else {
            textField.textColor = "black";
            textField.borderColor = focus ? FlatUI.emerald : FlatUI.silver;
        }
    }

    onErrorChanged: {
        if (error) {
            textField.textColor = FlatUI.alizarin;
            textField.borderColor = FlatUI.alizarin;
        }

        else {
            textField.textColor = "black";
            textField.borderColor = focus ? FlatUI.emerald : FlatUI.silver;
        }

    }
}
