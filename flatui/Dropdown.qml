import QtQuick 2.7
import QtQuick.Controls 2.0 as QQControls
import "."

QQControls.ComboBox {
    id: root
    model: ["First", "Second", "Third"]

    font {
        family: FlatUI.latoRegularFont.name
        pixelSize: 16
        bold: true
    }

    ButtonStyle {
        id: style
        __focused: area.activeFocus
        __hovered: area.containsMouse || root.activeFocus
        __pressed: area.pressed
        enabled: root.enabled
    }

    delegate: QQControls.ItemDelegate {
        width: root.width
        text: item
        font.weight: root.currentIndex === index ? Font.DemiBold : Font.Normal
        highlighted: root.highlightedIndex == index
    }

    indicator: Text {
        x: root.width - width - root.rightPadding
        y: root.topPadding + (root.availableHeight - height) / 2
        width: 12
        height: 4
        text: FlatUI.fontAwesome.fa_caret_down
        font.family: FlatUI.fontAwesome.name
        font.pixelSize: 16
        color: style.iconColor
    }

    contentItem: Text {
      leftPadding: 0
      rightPadding: root.indicator.width + root.spacing

      text: root.displayText
      font: root.font
      color: style.textColor
      horizontalAlignment: Text.AlignLeft
      verticalAlignment: Text.AlignVCenter
      elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        color: style.color
        radius: style.radius

        MouseArea {
            id: area
            hoverEnabled: true
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                if(!root.popup.visible)
                    root.popup.open()
                else
                    root.popup.close()
            }
        }
    }
}

