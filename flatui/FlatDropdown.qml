import QtQuick 2.4
import QtQuick.Controls 1.2
import "."

FlatButton {
    id: root
    width: root.textWidth + root.padding
    height: 40
    bold: false
    pointSize: 12
    color: FlatUI.turquoise
    highlightColor: "#48C9B0"
    textHorizontalOffset: -6
    checked: root.active
    z: FlatUI.dropdownZ


    property color dropdownColor: FlatUI.clouds
    property color dropdownHighlightColor: "#DFE2E3"
    property color dropdownTextColor: FlatUI.asbestos
    property int dropdownItemHeight: 40;
    readonly property int dropdownItemCount: listView.count
    property int dropdownWidth: width + 150;
    property int dropdownHeight: root.dropdownItemHeight * listView.count + 20
    property int dropdownRadius: 4;
    property bool enableScrollView: false;
    property int scrollViewHeight: 0;
    property int scrollViewWidth: 0;
    property bool active: false 
    property variant model: ListModel {
        ListElement {item: "Apple";}
        ListElement {item: "Orange"; separator: true}
        ListElement {item: "Kiwi"; separator: true}
        ListElement {item: "Squash"; separator: true}
        ListElement {item: "Tree Bark"; separator: true}
        ListElement {item: "Llama"; separator: true}
    }

    // Flat button properties
    readonly property alias defaultColor: root.defaultColor
    property alias pressColor: root.pressColor
    property alias highlightColor: root.highlightColor
    property alias checkedColor: root.checkedColor

    property alias text: root.text
    property alias textColor: root.textCheckedColor
    property alias textPressColor: root.pressColor
    property alias textHighlightColor: root.highlightColor
    property alias textCheckedColor: root.textCheckedColor
    readonly property alias disabledTextColor: root.disabledTextColor

    property alias pointSize: root.pointSize
    property alias padding: root.padding
    property alias fontFamily: root.fontFamily
    property alias bold: root.bold
    readonly property alias textWidth: root.textWidth
    readonly property alias textHeight: root.textHAlignment
    property alias textHorizontalOffset: root.textHorizontalOffset
    property variant textHAlignment: Qt.AlignHCenter

    readonly property alias hovered: root.hovered
    readonly property alias pressed: root.pressed

    ScrollView {
        id: scrollView;
        anchors {
            top: visible ? root.bottom : undefined;
            topMargin: 10;
        }
        height: root.scrollViewHeight == 0 ? root.dropdownItemHeight * listView.count : root.scrollViewHeight;
        width: root.scrollViewWidth == 0 ? root.dropdownWidth : root.scrollViewWidth;
        visible: root.active;
        contentItem: parent.enableScrollView ? dropdownBackground : null;
    }

    Rectangle {
        id: dropdownBackground;
        z: 100;
        radius: root.dropdownRadius
        visible: root.active
        height: root.dropdownHeight
        width: root.dropdownWidth
        color: root.dropdownColor

        anchors {
            top: scrollView.contentItem === null ? root.bottom : undefined;
            topMargin: 10;
        }

        ListView {
            id: listView;
            anchors.fill: parent;
            highlightFollowsCurrentItem: false
            property color highlightColor: root.dropdownHighlightColor
            clip: true

            model: root.model;
            property bool itemChecked: false;

            delegate: Item {
                width: listView.width;
                height: root.dropdownItemHeight;
                property string currentText: item;

                Rectangle {
                    id: separation;
                    color: Qt.rgba(.2, .2, .2, .3)
                    height: 2;
                    visible: separator;
                    anchors {
                        top: parent.top;
                        left: parent.left;
                        right: parent.right;
                    }
                }

                Item {
                    anchors {
                        top: separation.bottom;
                        left: parent.left;
                        right: parent.right;
                        bottom: parent.bottom;
                    }

                    Rectangle {
                        id: highlight
                        anchors.fill: parent
                        color: root.dropdownColor
                        radius: listView.currentIndex == 0 ? root.dropdownRadius : 0

                        states: [
                            State {
                                name: ""
                                when: !highlightArea.containsMouse
                                PropertyChanges {
                                    target: highlight
                                    color: root.dropdownColor
                                }
                            },

                            State {
                                name: "HOVERED"
                                when: highlightArea.containsMouse
                                PropertyChanges {
                                    target: highlight
                                    color: listView.highlightColor
                                }
                            }
                        ]

                        transitions: [
                            Transition {
                                from: ""
                                to: "HOVERED"

                                ColorAnimation { duration: 250 }
                            },

                            Transition {
                                from: "HOVERED"
                                to: ""

                                ColorAnimation {duration: 20 }
                            }
                        ]
                    }

                    MouseArea {
                        id: highlightArea
                        anchors.fill: parent;
                        hoverEnabled: !listView.itemChecked;
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            if (root.enableScrollView) {
                                if (listView.itemChecked) {
                                    listView.itemChecked = false
                                    listView.highlightColor = root.highlightColor
                                }
                                else {
                                    listView.itemChecked = true;
                                    listView.highlightColor = FlatUI.secondary
                                }
                            }
                            root.active = false;
                        }


                        onEntered: listView.currentIndex = index
                    }
                    Text {
                        id: textArea
                        width: contentWidth
                        height: contentHeight
                        text: item;
                        color: root.dropdownTextColor;
                        anchors {
                            left: parent.left;
                            leftMargin: 12;
                            verticalCenter: parent.verticalCenter;
                        }
                        font.pointSize: 10
                    }
                }
            }

            VerticalScrollBar {
                flickable: listView
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: 8
            }
        }
    }

    Text {
        id: downArrowGlyph
        anchors.right: parent.right
        anchors.rightMargin: root.textHorizontalOffset * -1
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 2
        font.family: FlatUI.glyphFont.name
        text: FlatUI.glyphFont.downArrow
        color: "white"
    }

    onClicked: root.active = !root.active
    Component.onCompleted: parent.z = root.z
}

