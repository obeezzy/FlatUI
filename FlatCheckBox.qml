import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

CheckBox {
    text: "Click me"
    FlatConstants {
        id: flatConstants
    }

    style: CheckBoxStyle {
        indicator: Text {
            font.pointSize: 15
            font.family: flatConstants.glyphFont.name

            text: {
                if(control.hovered || control.checked)
                    flatConstants.glyphFont.markedCheckBox
                else
                    flatConstants.glyphFont.unmarkedCheckBox
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
            color: flatConstants.midnightBlue
            text: control.text
        }

        spacing: 10
    }
}

