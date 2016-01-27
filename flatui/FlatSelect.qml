import QtQuick 2.3
import QtQuick.Controls 1.2
import "."

FlatButton {
    id: dropDown;
    text: "Default";
    checked: dropDown.active
    bold: false
    textHAlignment: Qt.AlignLeft
    color: FlatUI.turquoise
    highlightColor: "#48C9B0"
    pointSize: 12
    width: dropDown.textWidth + dropDown.padding
    height: 40

    Image {
        anchors {
            right: parent.right;
            rightMargin: 12;
            verticalCenter: parent.verticalCenter;
        }

        source: "src/arrow-down-b.png";

        height: 20;
        width: 20;
        sourceSize {
            height: parent.height;
            width: parent.width;
        }
        fillMode: Image.PreserveAspectFit;
    }

    property color dropdownColor: FlatUI.clouds
    property color dropdownHighlightColor: "#DFE2E3"
    property color dropdownTextColor: FlatUI.asbestos
    property int dropdownItemHeight: 40;
    readonly property int dropdownItemCount: listView.count
    property int dropdownWidth: width + 100;
    property int dropdownHeight: dropDown.dropdownItemHeight * listView.count + 20
    property int dropdownRadius: 4;
    property bool enableScrollView: false;
    property int scrollViewHeight: 0;
    property int scrollViewWidth: 0;
    property bool active: false

    property var model: ListModel {
        ListElement {item: "Apple";}
        ListElement {item: "Orange"; separator: true}
        ListElement {item: "Kiwi"; separator: true}
        ListElement {item: "Squash"; separator: true}
        ListElement {item: "Tree Bark"; separator: true}
        ListElement {item: "Llama"; separator: true}
    }

    ScrollView {
        id: scrollView;
        anchors {
            top: visible ? dropDown.bottom : undefined;
            topMargin: 10;
        }
        height: dropDown.scrollViewHeight == 0 ? dropDown.dropdownItemHeight * listView.count : dropDown.scrollViewHeight;
        width: dropDown.scrollViewWidth == 0 ? dropDown.dropdownWidth : dropDown.scrollViewWidth;
        visible: dropDown.active
        contentItem: parent.enableScrollView ? dropdownBackground : null;
    }

    Rectangle {
        id: dropdownBackground;
        z: 100;
        radius: dropDown.dropdownRadius;
        visible: dropDown.active
        height: dropDown.dropdownHeight
        width: dropDown.dropdownWidth;
        color: dropDown.dropdownColor;

        anchors {
            top: scrollView.contentItem === null ? dropDown.bottom : undefined;
            topMargin: 10;
        }

        ListView {
            id: listView;
            anchors.fill: parent;
            clip: true
            model: dropDown.model;
            property bool itemChecked: false;

            property color highlightColor: dropDown.dropdownHighlightColor

            delegate: Item {
                width: listView.width;
                height: dropDown.dropdownItemHeight;
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
                        color: dropDown.dropdownColor
                        radius: listView.currentIndex == 0 ? dropDown.dropdownRadius : 0

                        states: [
                            State {
                                name: ""
                                when: !highlightArea.containsMouse && listView.currentIndex != index
                                PropertyChanges {
                                    target: highlight
                                    color: dropDown.dropdownColor
                                }
                            },

                            State {
                                name: "HOVERED"
                                when: highlightArea.containsMouse
                                PropertyChanges {
                                    target: highlight
                                    color: listView.highlightColor
                                }

                                PropertyChanges {
                                    target: textArea
                                    color: dropDown.dropdownTextColor
                                }
                            },

                            State {
                                name: "LEFT"
                                when: !highlightArea.containsMouse && listView.currentIndex == index
                                PropertyChanges {
                                    target: highlight
                                    color: dropDown.defaultColor
                                }

                                PropertyChanges {
                                    target: textArea
                                    color: "white"
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
                            },

                            Transition {
                                from: "HOVERED"
                                to: "LEFT"
                                ColorAnimation {duration: 250}
                            },

                            Transition {
                                from: "LEFT"
                                to: ""

                                ColorAnimation {duration: 50}
                            }

                        ]
                    }

                    MouseArea {
                        id: highlightArea
                        anchors.fill: parent;
                        hoverEnabled: !listView.itemChecked;
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            if (dropDown.enableScrollView) {
                                if (listView.itemChecked) {
                                    listView.itemChecked = false
                                    listView.highlightColor = dropDown.highlightColor
                                }
                                else {
                                    listView.itemChecked = true;
                                    listView.highlightColor = FlatUI.secondary
                                }
                            }

                            dropDown.text = listView.currentItem.currentText
                            dropDown.active = false;
                        }


                        onEntered: listView.currentIndex = index
                    }
                    Text {
                        id: textArea
                        width: contentWidth
                        height: contentHeight
                        text: item;
                        color: dropDown.dropdownTextColor;
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

            Component.onCompleted: dropDown.text = currentItem.currentText
        }
    }

    onClicked: dropDown.active = !dropDown.active
    Component.onCompleted: parent.z = 100;
}
