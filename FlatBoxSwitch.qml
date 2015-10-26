import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

FlatSwitch {
    radius: 6
    offText: flatConstants.glyphFont.x
    onText: flatConstants.glyphFont.check
    fontFamily: flatConstants.glyphFont.name
    handleBorderWidth: 0
    handleRadius: radius
    handleWidth: height
    handleOffset: 0
    offsetsUsed: false

    FlatConstants {
        id: flatConstants
    }
}
