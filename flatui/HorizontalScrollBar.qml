import QtQuick 2.4

Item {
    id: scrollBar
    height: background.height
    visible: (flickable.visibleArea.widthRatio < 1) || scrollBar.alwaysVisible ? true : false

    // The properties that define the scrollbar's state.
    // position and pageSize are in the range 0.0 - 1.0.  They are relative to the
    // height of the page, i.e. a pageSize of 0.5 means that you can see 50%
    // of the height of the view.
    // orientation can be either Qt.Vertical or Qt.Horizontal
    readonly property real position: flickable.visibleArea.xPosition
    readonly property real pageSize: flickable.visibleArea.widthRatio
    readonly property int minimumWidth: 20

    property Flickable flickable
    property bool alwaysVisible: false


    property alias backgroundColor: background.color
    property alias handleColor: handle.color

    // A light, semi-transparent background
    Rectangle {
        id: background
        anchors.fill: parent
        radius: (height / 2 - 1)
        color: Qt.rgba(.9, .9, .9, .5)
        height: 6
    }

    // Size the bar to the required size, depending upon the orientation.
    //x: scrollBar.position * (scrollBar.width-2) + 1
    Rectangle {
        id: handle
        y: 0
        width: {
            if(scrollBar.pageSize * (scrollBar.width - 2) < scrollBar.minimumWidth)
                scrollBar.minimumWidth
            else
                scrollBar.pageSize * (scrollBar.width - 2)
        }
        height: parent.height
        radius: height/2 - 1
        color: Qt.rgba(.5, .5, .5, .5)

        Binding {
            target: handle
            property: "x"
            value: {
                if(!isNaN(flickable.visibleArea.widthRatio))
                    (area.drag.maximumX * flickable.contentX) / (flickable.contentWidth * (1 - flickable.visibleArea.widthRatio))
                else
                    0
            }
            when: !area.drag.active
        }

        Binding {
            target: flickable
            property: "contentX"
            value: ((flickable.contentWidth * (1 - flickable.visibleArea.widthRatio)) * handle.x) / area.drag.maximumX
            when: area.drag.active && flickable !== undefined
        }

        MouseArea {
            id: area
            anchors.fill: parent
            hoverEnabled: true
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: scrollBar.width - handle.width//flk.height - scrl.height
            preventStealing: true
        }
    }
}
