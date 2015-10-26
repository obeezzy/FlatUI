import QtQuick 2.4

Rectangle {
    id: root
    width: 180
    height: 62
    color: flatConstants.glossyWetAsphalt

    property string iconFontFamily: flatConstants.fontAwesome.name

    property variant model: listModel
    property string currentTab: ""
    property string currentSubTab: ""
    property var dataset: [
        {title: "First", name: "first", iconText: flatConstants.fontAwesome.fa_dollar, collapsed: true, submenu: [
                {title: "Hello", name: "hello", iconText: flatConstants.fontAwesome.fa_bank},
                {title: "Bye", name: "bye", iconText: flatConstants.fontAwesome.fa_book}
            ]},
        {title: "Second", name: "second", iconText: flatConstants.fontAwesome.fa_music}
    ]

    signal itemClicked(string title, string subtitle)

    ListModel { id: listModel }

    FlatConstants {
        id: flatConstants
    }

    ListView {
        id: listView
        anchors.fill: parent
        model: root.model
        clip: true

        delegate: Column {
            width: topDelegate.width
            Component.onCompleted: {
                if(listView.currentIndex == index)
                    root.currentTab = title
            }

            Rectangle {
                id: topDelegate
                width: listView.width
                height: 50

                color: {
                    if(delegateArea.containsMouse)
                        "#415B76" //"#5E6972"
                    else if(listView.currentIndex == index)
                        flatConstants.midnightBlue
                    else
                        flatConstants.glossyWetAsphalt
                }

                readonly property bool submenuCollapsed: collapseRequested || listView.currentIndex != index
                property bool collapseRequested: collapsed
                readonly property int submenuHeight: 30

                Behavior on color { ColorAnimation {} }

                Rectangle {
                    id: strip
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: listView.currentIndex == index ? 5 : 0
                    color: flatConstants.turquoise

                    Behavior on width { NumberAnimation {} }
                }

                Text {
                    id: iconLabel
                    anchors.left: strip.right
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: iconText
                    font.family: root.iconFontFamily
                    font.pointSize: 14
                    color: listView.currentIndex == index ? flatConstants.turquoise : "white"
                    width: 20

                    Behavior on color { ColorAnimation {} }
                }

                Text {
                    id: mainLabel
                    anchors.left: iconLabel.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: title
                    font.pointSize: 12
                    font.family: flatConstants.latoRegularFont.name
                    color: listView.currentIndex == index ? flatConstants.turquoise : "white"

                    Behavior on color { ColorAnimation {} }
                }

                Text {
                    id: subMenuArrow
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 2
                    visible: submenu != undefined && submenu != null
                    text: flatConstants.glyphFont.rightStickArrow
                    font.pointSize: 8
                    font.family: flatConstants.glyphFont.name
                    color: listView.currentIndex == index ? flatConstants.turquoise : "white"
                    transformOrigin: Item.Center
                    rotation: listView.currentIndex == index && !topDelegate.submenuCollapsed ? 90 : 0

                    Behavior on rotation { NumberAnimation {} }
                }

                MouseArea {
                    id: delegateArea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true

                    onClicked: {
                        if(listView.currentIndex == index) // Skip the first time
                            topDelegate.collapseRequested = !topDelegate.collapseRequested

                        listView.currentIndex = index
                        root.currentTab = name

                        root.itemClicked(name, undefined)
                    }
                }
            }

            Loader {
                id: loader
                height: {
                    if(topDelegate.submenuCollapsed || submenu == undefined)
                        0
                    else
                        submenu.count * topDelegate.submenuHeight
                }

                sourceComponent: topDelegate.submenuCollapsed ? null : submenuComponent
                visible: height != 0

                Behavior on height { NumberAnimation {} }

                Component {
                    id: submenuComponent
                    Column {
                        id: submenuColumn
                        property int currentIndex: -1

                        Repeater {
                            model: submenu
                            delegate: Rectangle {
                                width: listView.width
                                height: topDelegate.submenuHeight
                                color: {
                                    if(subDelegateArea.containsMouse)
                                        "#415B76" // "#5E6972"
                                    else if(submenuColumn.currentIndex == index)
                                        flatConstants.midnightBlue
                                    else
                                        flatConstants.glossyWetAsphalt
                                }

                                Behavior on color { ColorAnimation {} }

                                Rectangle {
                                    id: subStrip
                                    anchors.left: parent.left
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom
                                    width: submenuColumn.currentIndex == index ? 5 : 0
                                    color: flatConstants.turquoise

                                    Behavior on width { NumberAnimation {} }
                                }

                                Text {
                                    id: subIconLabel
                                    anchors.left: subStrip.right
                                    anchors.leftMargin: 25
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: model.iconText
                                    font.family: root.iconFontFamily
                                    font.pointSize: 10
                                    color: submenuColumn.currentIndex == index ? flatConstants.turquoise : "white"

                                    Behavior on color { ColorAnimation {} }
                                }

                                Text {
                                    id: subMainLabel
                                    anchors.left: subIconLabel.right
                                    anchors.leftMargin: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: model.title
                                    font.pointSize: 10
                                    font.family: flatConstants.latoRegularFont.name
                                    color: submenuColumn.currentIndex == index ? flatConstants.turquoise : "white"

                                    Behavior on color { ColorAnimation {} }
                                }

                                MouseArea {
                                    id: subDelegateArea
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    hoverEnabled: true

                                    onClicked: {
                                        submenuColumn.currentIndex = index
                                        root.currentSubTab = title

                                        root.itemClicked(root.currentTab, name)
                                    }
                                }
                            }

                            Component.onCompleted: {
                                if(submenuColumn.currentIndex == index)
                                    root.currentSubTab = title
                            }
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        if(listModel.count == 0)
        {
            for(var i = 0; i < dataset.length; ++i)
                listModel.append(dataset[i])
        }
        else{
            dataset = []
        }
    }
}

