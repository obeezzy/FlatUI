import QtQuick 2.7
import "."

Style {
    id: root
    name: "primary"

    property int radius: 6
    property bool __hovered: false
    property bool __pressed: false
    property bool __checked: false
    readonly property bool __checkable: name == "checkable"

    readonly property color disabledColor: "#EAECED"

    property alias icon: icon

    Text {
        id: icon
        color: root.textColor
        font.family: FlatUI.fontAwesome.name
    }

    property color color: {
        if(!enabled)
            FlatUI.silver
        else {
            switch(name) {
            case "primary":
                FlatUI.turquoise
                break;
            case "warning":
                FlatUI.sunFlower
                break;
            case "default":
                FlatUI.silver;
                break;
            case "danger":
                FlatUI.alizarin
                break;
            case "success":
                FlatUI.emerald
                break;
            case "inverse":
                FlatUI.midnightBlue
                break;
            case "info":
                FlatUI.peterRiver
                break;
            case "checkable":
                FlatUI.silver
                break;
            case "nav_button":
                FlatUI.wetAsphalt
                break;
            default:
                break;
            }
        }
    }
    property color defaultColor: {
        switch(name) {
        case "primary":
            FlatUI.turquoise
            break;
        case "warning":
            FlatUI.sunFlower
            break;
        case "default":
            FlatUI.silver;
            break;
        case "danger":
            FlatUI.alizarin
            break;
        case "success":
            FlatUI.emerald
            break;
        case "inverse":
            FlatUI.midnightBlue
            break;
        case "info":
            FlatUI.peterRiver
            break;
        case "checkable":
            FlatUI.silver
            break;
        case "nav_button":
            FlatUI.wetAsphalt
            break;
        default:
            FlatUI.silver
            break;
        }
    }
    property color pressColor: {
        switch(name) {
        case "primary":
            FlatUI.greenSea;
            break;
        case "warning":
            "#cda70d";
            break;
        case "default":
            "#a1a6a9";
            break;
        case "danger":
            "#c44133"
            break;
        case "success":
            "#27AD60"
            break;
        case "inverse":
            "#2C3E50"
            break;
        case "info":
            "#2C81BA"
            break;
        case "disabled":
            break;
        case "checkable":
            FlatUI.turquoise
            break;
        case "nav_button":
            FlatUI.wetAsphalt
            break;
        default:
            FlatUI.greenSea;
            break;
        }
    }
    property color highlightColor: {
        switch(name) {
        case "primary":
            "#48c9b0";
            break;
        case "warning":
            "#f4d313"
            break;
        case "default":
            "#cacfd2";
            break;
        case "danger":
            "#ec7063"
            break;
        case "success":
            "#58D68D"
            break;
        case "inverse":
            "#415B76"
            break;
        case "info":
            "#5DADE2"
            break;
        case "disabled":
            break;
        case "checkable":
            FlatUI.turquoise
            break;
        case "nav_button":
            FlatUI.wetAsphalt
            break;
        default:
            "#48c9b0";
            break;
        }
    }
    property color checkedColor: {
        switch(name) {
        case "primary":
            FlatUI.greenSea
            break;
        case "warning":
            FlatUI.sunFlower
            break;
        case "default":
            FlatUI.silver
            break;
        case "danger":
            FlatUI.alizarin
            break;
        case "success":
            FlatUI.emerald
            break;
        case "inverse":
            FlatUI.midnightBlue
            break;
        case "info":
            FlatUI.peterRiver
            break;
        case "disabled":
            break;
        case "checkable":
            FlatUI.turquoise
            break;
        default:
            FlatUI.greenSea
            break;
        }
    }

    property color textColor: {
        if(name == "checkable" && root.enabled)
        {
            if(root.__focused)
                FlatUI.turquoise
            else
                FlatUI.midnightBlue
        }
        else if(root.enabled)
            "white"
        else
            "#EAECED"
    }
    property color textPressColor: {
        if(name == "nav_button" && root.enabled)
            FlatUI.turquoise
        else
            textColor
    }
    property color textHighlightColor: {
        if(name == "nav_button" && root.enabled)
            FlatUI.turquoise
        else
            textColor
    }
    property color textCheckedColor: {
        if(name == "nav_button" && root.enabled)
            FlatUI.turquoise
        else
            textColor
    }

    property color iconColor: "white"

    states: [
        State {
            name: ""
            when: !root.enabled
            PropertyChanges {
                target: root
                color: root.defaultColor
            }
        },

        State {
            name: "HOVERED"
            when: root.__hovered && !root.__pressed
            PropertyChanges {
                target: root
                color: root.highlightColor
            }
        },

        State {
            name: "PRESSED"
            when: root.__pressed
            PropertyChanges {
                target: root
                color: root.pressColor
            }
        },

        State {
            name: "CHECKED"
            when: root.__checked && root.__checkable
            PropertyChanges {
                target: root
                color: root.checkedColor
            }
        }
    ]

    transitions: Transition {ColorAnimation { duration: 250 } }

    SequentialAnimation on textColor {
        running: root.__focused && root.name != "checkable"
        loops: Animation.Infinite

        ColorAnimation {
            to: "#eeeeee"
            duration: 700
        }

        ColorAnimation {
            to: "white"
            duration: 700
        }

        onRunningChanged: {
            if(!running)
                textColor = "white"
        }
    }
}
