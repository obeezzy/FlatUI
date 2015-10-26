import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

TextField {
    id: root
    height: 47;
    width: 215;

    FlatConstants {
        id: flatConstants;
    }

    // TODO
    // Change text color on Error and Success

    property color borderColor: root.activeFocus ? root.activeBorderColor : root.inactiveBorderColor
    property color backgroundColor: !root.enabled ? "#f7f9f9" : "white";
    property int pointSize: 11;
    property bool error: false;
    property bool success: false;
    readonly property alias flatConstants: flatConstants

    property color activeBorderColor: flatConstants.turquoise
    property color inactiveBorderColor: flatConstants.silver
    property color activeTextColor: "black"
    property color inactiveTextColor: root.activeTextColor
    property color selectionColor: "white"
    property color selectedTextColor: "#7F96FF"
    property string fontFamily: flatConstants.latoRegularFont.name
    property color placeholderTextColor: flatConstants.silver

    onEnabledChanged: {
        if (!root.enabled) {
            root.borderColor = "#e1e6e6";
            root.textColor = "#e1e6e6";
        }

        else {
            root.textColor = "black";
        }
    }

    onSuccessChanged: {
        if (success) {
            root.textColor = flatConstants.emerald;
            root.borderColor = flatConstants.emerald;
        }

        else if(error) {
            root.textColor = flatConstants.alizarin;
            root.borderColor = flatConstants.alizarin;
        }

        else {
            root.textColor = activeTextColor;
            root.borderColor = root.activeFocus ? root.activeBorderColor : root.inactiveBorderColor
        }
    }

    onErrorChanged: {
        if (error) {
            root.textColor = flatConstants.alizarin;
            root.borderColor = flatConstants.alizarin;
        }

        else if (success) {
            root.textColor = flatConstants.emerald;
            root.borderColor = flatConstants.emerald;
        }

        else {
            root.textColor = "black";
            root.borderColor = root.activeFocus ? root.activeBorderColor : root.inactiveBorderColor
        }

    }


    placeholderText: "Input";
    style: TextFieldStyle {
        padding.left: 12;
        font {
            pointSize: control.pointSize;
            family: root.fontFamily
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
        }

        placeholderTextColor: root.placeholderTextColor
        textColor: control.activeFocus ? root.activeTextColor : root.inactiveTextColor
        selectionColor: root.selectionColor
        selectedTextColor: root.selectedTextColor
    }

    Behavior on borderColor { ColorAnimation { } }
}
