import QtQuick 2.4
import "."

Rectangle {
    id: root
    width: backButton.width + leftSeparator.width + listView.width + nextButton.width
    height: 40
    color: FlatUI.clouds
    radius: 4

    property int count: 8
    property int visibleCount: 4
    property int elementWidth: 42

    property int checkedIndex: -1

    property color defaultColor: FlatUI.turquoise
    property color separatorColor: "#E3E7EA" //FlatUI.clouds

//    property color defaultColor: "#D7DBDE"
//    property color separatorColor: "#E3E7EA"

    signal clicked(int index)

    FlatIconButton {
        id: backButton
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 50
        text: FlatUI.glyphFont.leftStickArrow
        //leftCornerCurved: true
        color: "#D6DBDF"
        z: 1
        enabled: listView.contentX != 0

        onClicked: {
            if(listView.contentX > 0)
                listView.contentX -= (root.visibleCount * root.elementWidth)
        }
    }

    Rectangle {
        id: leftSeparator
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: backButton.right
        width: 2
        color: root.separatorColor
    }

    ListView {
        id: listView
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: leftSeparator.right
        width: root.elementWidth * root.visibleCount
        orientation: ListView.Horizontal
        interactive: false
        model: ListModel { id: listModel }

        delegate: FlatNumberNavButton {
            height: ListView.view.height
            width: elementWidth
            text: name
            defaultColor: root.defaultColor;
            checked: root.checkedIndex == index
            pointSize: 11

            onClicked: {
                root.checkedIndex = index
                root.clicked(index)
            }

            // Separator
            Rectangle {
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                width: 2
                color: root.separatorColor
            }
        }

        Behavior on contentX {enabled: !a.running; PropertyAnimation {id: a; easing.type: Easing.InOutBounce; alwaysRunToEnd: true} }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 2
            width: contentWidth
            height: contentHeight
            font.pointSize: 12
            text: (root.checkedIndex + 1) + " of " + root.count
            color: root.checkedIndex == -1 ? "transparent" : FlatUI.turquoise
            opacity: 0
            font.underline: positionInfoArea.containsMouse

            SequentialAnimation on opacity {
                id: textFadeAnim
                running: false
                loops: 1

                PropertyAnimation {to: 0; duration: 10}
                PropertyAnimation {to: 1; duration: 800 }
            }

            MouseArea {
                id: positionInfoArea
//                anchors.fill: parent
//                hoverEnabled: true
//                cursorShape: root.checkedIndex != -1 ? Qt.PointingHandCursor : Qt.ArrowCursor
//                enabled: root.checkedIndex != -1

//                onClicked: {
//                    console.log("list view current index? ", listView.currentIndex)
//                    console.log("Root visible count?", root.visibleCount)
//                    console.log("Result: ", (listView.currentIndex + 1) / root.visibleCount)
//                    listView.positionViewAtIndex((listView.currentIndex) / root.visibleCount, ListView.Beginning)
//                }
            }

            Component.onCompleted: {
                if(checkedIndex != -1)
                    textFadeAnim.start()
            }
        }
    }

    FlatIconButton {
        id: nextButton
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 50
        text: FlatUI.glyphFont.rightStickArrow
        //rightCornerCurved: true
        defaultColor: "#D6DBDF"
        enabled: (listView.contentX + root.elementWidth * root.visibleCount) != listView.contentWidth
        z: 1

        onClicked: {
            if((listView.contentX + root.elementWidth * root.visibleCount) < listView.contentWidth)
                listView.contentX += (root.visibleCount * root.elementWidth)
        }
    }

    onCheckedIndexChanged: textFadeAnim.start()

    Component.onCompleted: {
        var properties = {}

        for(var i = 0; i < root.count; ++i)
        {
            properties.name = i + 1
            listModel.append(properties)
        }
    }
}

