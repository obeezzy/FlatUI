import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

FlatInput {
    id: root
    property string iconText: flatConstants.glyphFont.search
    property string iconFontFamily: flatConstants.glyphFont.name

    style: TextFieldStyle {
        padding.left: 12;
        padding.right: 32

        font {
            pointSize: control.pointSize;
            family: flatConstants.latoRegularFont.name
        }

        background: Rectangle {
            height: control.height;
            width: control.width;
            color: control.backgroundColor;
            border {
                width: 2;
                color: control.borderColor;
            }
            radius: 4;

            Text {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 14
                width: contentWidth
                height: contentHeight
                text: root.iconText
                font.family: root.iconFontFamily
                color: root.borderColor
                font.pointSize: 12
            }
        }
    }
}

//Rectangle {
//    id: root
//    height: 47;
//    width: 215;
//    border.width: 2
//    border.color: textField.activeFocus ? root.activeBorderColor : root.inactiveBorderColor
//    color: "white"
//    radius: 4

//    property color activeBorderColor: flatConstants.turquoise
//    property color inactiveBorderColor: flatConstants.silver
//    property color activeTextColor: "black"
//    property color inactiveTextColor: root.activeTextColor
//    property color selectionColor: "white"
//    property color selectedTextColor: "#7F96FF"
//    property color backgroundColor: !root.enabled ? "#f7f9f9" : "white";
//    property int pointSize: 11;
//    property bool error: false;
//    property bool success: false;
//    property string iconText: flatConstants.glyphFont.search
//    property string fontFamily: flatConstants.glyphFont.name
//    property string placeholderText: "Input"
//    property color placeholderTextColor: flatConstants.silver
//    property string text: ""
//    property alias echoMode: textField.echoMode
//    readonly property alias flatConstants: flatConstants

//    Behavior on border.color { ColorAnimation {} }

//    FlatConstants {
//        id: flatConstants
//    }

//    TextField {
//        id: textField
//        placeholderText: root.placeholderText
//        text: root.text
//        font.family: flatConstants.latoRegularFont.name
//        font.pointSize: root.pointSize
//        anchors.left: parent.left
//        anchors.right: iconRect.left
//        anchors.margins: 2
//        anchors.rightMargin: 0
//        anchors.top: parent.top
//        anchors.bottom: parent.bottom

//        style: TextFieldStyle {
//            background: Rectangle {
//                color: root.color
//                radius: 4
//            }

//            placeholderTextColor: root.placeholderTextColor
//            textColor: control.activeFocus ? root.activeTextColor : root.inactiveTextColor
//            selectionColor: root.selectionColor
//            selectedTextColor: root.selectedTextColor
//        }
//    }

//    Rectangle {
//        id: iconRect
//        anchors.right: parent.right
//        anchors.top: parent.top
//        anchors.bottom: parent.bottom
//        anchors.margins: 2
//        width: 30
//        color: "white"
//        border.color: area.pressed ? flatConstants.belize_hole : ""
//        border.width: area.pressed ? 2 : 0

//        Text {
//            id: icon
//            font.family: root.fontFamily
//            font.pointSize: 12
//            anchors.centerIn: parent
//            text: root.iconText
//            verticalAlignment: Qt.AlignVCenter
//            horizontalAlignment: Qt.AlignHCenter
//            width: contentWidth
//            height: contentHeight
//            color: root.border.color

//            //Behavior on color { ColorAnimation {} }
//        }

//        MouseArea {
//            id: area
//            anchors.fill: parent
//            cursorShape: Qt.PointingHandCursor
//            hoverEnabled: true
//        }
//    }

//    onEnabledChanged: {
//        if (!root.enabled) {
//            textField.borderColor = "#e1e6e6";
//            textField.textColor = "#e1e6e6";
//        }

//        else
//            textField.textColor = "black";
//    }

//    onSuccessChanged: {
//        if (success) {
//            textField.textColor = flatConstants.emerald;
//            textField.borderColor = flatConstants.emerald;
//        }

//        else {
//            textField.textColor = "black";
//            textField.borderColor = focus ? flatConstants.emerald : flatConstants.silver;
//        }
//    }

//    onErrorChanged: {
//        if (error) {
//            textField.textColor = flatConstants.alizarin;
//            textField.borderColor = flatConstants.alizarin;
//        }

//        else {
//            textField.textColor = "black";
//            textField.borderColor = focus ? flatConstants.emerald : flatConstants.silver;
//        }

//    }
//}
