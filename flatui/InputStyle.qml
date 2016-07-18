import QtQuick 2.7
import "."

Style {
    id: root
    state: name
    leftPadding: 12
    rightPadding: 12

    property int radius: 4
    property int borderWidth: 2
    property color color: root.enabled ? "white" : '#cccccc'//"#f7f9f9"

    readonly property color disabledTextColor: "#e1e6e6"

    property alias icon: icon

    // For the icon
    Text {
        id: icon
        visible: false

        color: root.borderColor
    }

    property color textColor: {
        if(!root.enabled)
            root.disabledTextColor
        else {
            switch(root.state) {
            case "success":
                FlatUI.emerald;
                break;
            case "error":
                FlatUI.alizarin
                break;
            default:
                "black"
                break;
            }
        }
    }

    property color borderColor: {
        if(!root.enabled)
            root.disabledTextColor
        else if(root.__focused) {
            switch(root.state) {
            case "success":
                FlatUI.emerald
                break;
            case "error":
                FlatUI.alizarin
                break;
            default:
                FlatUI.turquoise
                break;
            }
        }
        else
            FlatUI.silver
    }

    Behavior on borderColor { ColorAnimation { } }
}
