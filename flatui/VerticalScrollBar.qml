import QtQuick 2.4

Item {
    id: scrollBar
    width: background.width
    visible: (flickable.visibleArea.heightRatio < 1) || scrollBar.alwaysVisible ? true : false

    // The properties that define the scrollbar's state.
    // position and pageSize are in the range 0.0 - 1.0.  They are relative to the
    // height of the page, i.e. a pageSize of 0.5 means that you can see 50%
    // of the height of the view.
    // orientation can be either Qt.Vertical or Qt.Horizontal
    readonly property real position: flickable.visibleArea.yPosition
    readonly property real pageSize: flickable.visibleArea.heightRatio
    readonly property int minimumHeight: 20
    property Flickable flickable

    property bool alwaysVisible: false
    property int expandedOffset: 8


    property alias backgroundColor: background.color
    property alias handleColor: handle.color

    // A light, semi-transparent background
    Rectangle {
        id: background
        anchors.fill: parent
        radius: (width / 2 - 1)
        color: Qt.rgba(.9, .9, .9, .5)
        width: 5

        property int defaultWidth

        Behavior on x {NumberAnimation {}}
        Behavior on width {NumberAnimation {}}
    }

    // Size the bar to the required size, depending upon the orientation.
    //y: (scrollBar.position * (scrollBar.height - 2) + 1) // "y" is handled by bindings below
    Rectangle {
        id: handle
        x: 0
        radius: width / 2 - 1
        color: Qt.rgba(.5, .5, .5, .5)
        width: parent.width
        height: {
            if(scrollBar.pageSize * (scrollBar.height - 2) < scrollBar.minimumHeight)
                scrollBar.minimumHeight
            else
                scrollBar.pageSize * (scrollBar.height - 2)
        }


        Binding {
            target: handle
            property: "y"
            value: {
                if(!isNaN(flickable.visibleArea.heightRatio))
                    (area.drag.maximumY * flickable.contentY) / (flickable.contentHeight * (1 - flickable.visibleArea.heightRatio))
                else
                    0
            }
            when: !area.drag.active
        }

        Binding {
            target: flickable
            property: "contentY"
            value: ((flickable.contentHeight * (1 - flickable.visibleArea.heightRatio)) * handle.y) / area.drag.maximumY
            when: area.drag.active && flickable !== undefined
        }

        MouseArea {
            id: area
            anchors.fill: parent
            hoverEnabled: true
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: 0
            drag.maximumY: scrollBar.height - handle.height
            preventStealing: true

            onContainsMouseChanged: {
                if(containsMouse) {
                    background.width = background.defaultWidth + scrollBar.expandedOffset
                    background.x -= scrollBar.expandedOffset
                }
                else {
                    background.width = background.defaultWidth
                    background.x += scrollBar.expandedOffset
                }
            }
        }
    }

    Component.onCompleted: background.defaultWidth = scrollBar.width
}
