import QtQuick 2.7
import "."

Style {
    property int radius: 40
    property color offColor: FlatUI.silver
    property color offTextColor: "white"
    property string offText: "OFF"

    property color onColor: FlatUI.wetAsphalt
    property color onTextColor: FlatUI.turquoise
    property string onText: "ON"

    property color handleOnColor: FlatUI.turquoise
    property color handleOffColor: FlatUI.asbestos
}
