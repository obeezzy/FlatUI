import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."

CheckBox {
    text: "Click me"

    style: CheckBoxStyle {
        indicator: Text {
            font.pointSize: 15
            font.family: FlatUI.glyphFont.name

            text: {
                if(control.hovered || control.checked)
                    FlatUI.glyphFont.markedCheckBox
                else
                    FlatUI.glyphFont.unmarkedCheckBox
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
            color: FlatUI.midnightBlue
            text: control.text
        }

        spacing: 10
    }
}

