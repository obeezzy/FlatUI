import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

RadioButton {
    id: radioButton;
    FlatConstants {
        id: flatConstants
    }

    text: "Default";
    property string textColor: flatConstants.midnightBlue
    property int spacing: 10

    style: RadioButtonStyle {
        spacing: control.spacing;

        indicator: Text {
            font.pointSize: 15
            font.family: flatConstants.glyphFont.name

            text: {
                if(control.hovered || control.checked)
                    flatConstants.glyphFont.markedRadioButton
                else
                    flatConstants.glyphFont.unmarkedRadioButton
            }
            color: {
                if(!control.enabled)
                    flatConstants.clouds
                else if(control.checked)
                    flatConstants.turquoise
                else
                    flatConstants.silver
            }

            Behavior on color { ColorAnimation {} }
        }

        label: Text {
            font.family: flatConstants.latoRegularFont.name
            font.pointSize: 10
            color: control.textColor
            text: control.text
        }
    }
}
