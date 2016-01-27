import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."

TextField {
    id: textField
    height: 47;
    width: 215;

    // TODO
    // Change text color on Error and Success

    property color borderColor: focus ? FlatUI.emerald : FlatUI.silver;
    property color backgroundColor: disabled ? "#f7f9f9" : "white";
    property int pointSize: 11;
    property bool disabled: !textField.enabled;
    property bool error: false;
    property bool success: false;

    onDisabledChanged: {
        if (disabled) {
            textField.borderColor = "#e1e6e6";
            textField.textColor = "#e1e6e6";
        }

        else {
            textField.textColor = "black";
        }
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


    MouseArea {
        anchors.fill: parent;
        enabled: textField.disabled;
    }

    placeholderText: "Input";
    style: TextFieldStyle {
        padding.left: 12;
        font {
            pointSize: control.pointSize;
            family: FlatUI.latoRegularFont.name
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
    }

    Behavior on borderColor { ColorAnimation { } }
}
