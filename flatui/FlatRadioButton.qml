import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."

RadioButton {
    id: radioButton;

    text: "Default";
    property string textColor: FlatUI.midnightBlue
    property int spacing: 10

    style: RadioButtonStyle {
        spacing: control.spacing;

        indicator: Text {
            font.pointSize: 15
            font.family: FlatUI.glyphFont.name

            text: {
                if(control.hovered || control.checked)
                    FlatUI.glyphFont.markedRadioButton
                else
                    FlatUI.glyphFont.unmarkedRadioButton
            }
            color: {
                if(!control.enabled)
                    FlatUI.clouds
                else if(control.checked)
                    FlatUI.turquoise
                else
                    FlatUI.silver
            }

            Behavior on color { ColorAnimation {} }
        }

        label: Text {
            font.family: FlatUI.latoRegularFont.name
            font.pointSize: 10
            color: control.textColor
            text: control.text
        }
    }
}
