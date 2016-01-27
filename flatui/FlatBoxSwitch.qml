import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."

FlatSwitch {
    radius: 6
    offText: FlatUI.glyphFont.x
    onText: FlatUI.glyphFont.check
    fontFamily: FlatUI.glyphFont.name
    handleBorderWidth: 0
    handleRadius: radius
    handleWidth: height
    handleOffset: 0
    offsetsUsed: false
}
