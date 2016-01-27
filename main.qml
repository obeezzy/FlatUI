import QtQuick 2.4
import QtQuick.Window 2.2
import "flatui"
import QtQuick.Controls 1.2

Window {
    id: window
    visible: true
    width: 680
    height: 480

    ScrollView {
        width: mainContent.width
        height: window.height

        Item {
            id: mainContent
            width: window.width
            height: header.height + mainLayout.height + 200

            readonly property int marginWidth: 100
            Item {
                id: leftMargin
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: parent.marginWidth
            }

            Item {
                id: rightMargin
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: parent.marginWidth
            }

            Text {
                id: header
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.bottomMargin: 20

                text: "Flat UI"
                width: contentWidth
                height: contentHeight
                color: FlatUI.midnightBlue
                font {
                    family: FlatUI.latoBlackFont.name
                    bold: true
                    pointSize: 50
                }
            }

            Column {
                id: mainLayout
                anchors.top: header.bottom
                anchors.topMargin: 30
                anchors.left: leftMargin.right
                anchors.right: rightMargin.left
                spacing: 25

                Text {
                    text: "Basic elements"
                    width: contentWidth
                    height: contentHeight
                    color: FlatUI.midnightBlue
                    font {
                        family: FlatUI.latoRegularFont.name
                        bold: true
                        pointSize: 30
                    }
                }

                Text {
                    text: "Buttons"
                    width: contentWidth
                    height: contentHeight
                    color: FlatUI.midnightBlue
                    font {
                        family: FlatUI.latoRegularFont.name
                        bold: true
                        pointSize: 18
                    }
                }

                Grid {
                    columns: 4
                    rows: 4
                    rowSpacing: 40
                    columnSpacing: 40

                    FlatPrimaryButton {}
                    FlatWarningButton {}
                    FlatDefaultButton {}
                    FlatDangerButton {}
                    FlatSuccessButton {}
                    FlatInverseButton {}
                    FlatInfoButton {}
                    FlatPrimaryButton {enabled: false; text: "Disabled Button"}
                }

                Text {
                    text: "Input"
                    width: contentWidth
                    height: contentHeight
                    color: FlatUI.midnightBlue
                    font {
                        family: FlatUI.latoRegularFont.name
                        bold: true
                        pointSize: 18
                    }
                }

                Row {
                    spacing: 20

                    FlatInput {placeholderText: "Inactive"}
                    FlatInput {error: true; text: "Error"}
                    FlatInput {success: true; text: "Success"}
                    FlatInput {enabled: false; text: "Disabled"}
                }

                Row {
                    spacing: 200
                    z: FlatUI.dropdownZ

                    Column {
                        spacing: 30
                        Text {
                            text: "Dropdown"
                            width: contentWidth
                            height: contentHeight
                            color: FlatUI.midnightBlue
                            font {
                                family: FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        FlatDropdown {
                            text: "Default";
                            dropdownHeight: 150

                            model: ListModel {
                                ListElement {item: "Action"; separator: false}
                                ListElement {item: "Another action"; separator: false}
                                ListElement {item: "Something else here"; separator: false}
                                ListElement {item: "Separated link"; separator: true}
                            }
                        }
                    }

                    Column {
                        spacing: 30
                        Text {
                            text: "Select"
                            width: contentWidth
                            height: contentHeight
                            color: FlatUI.midnightBlue
                            font {
                                family: FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        FlatSelect {
                            dropdownHeight: 150

                            model: ListModel {
                                ListElement {item: "Action"; separator: false}
                                ListElement {item: "Another action"; separator: false}
                                ListElement {item: "Something else here"; separator: false}
                                ListElement {item: "Separated link"; separator: true}
                            }
                        }
                    }
                }


                Text {
                    text: "Navbar"
                    width: contentWidth
                    height: contentHeight
                    color: FlatUI.midnightBlue
                    font {
                        family: FlatUI.latoRegularFont.name
                        bold: true
                        pointSize: 18
                    }
                }

                FlatTopNavBar {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    searchBarVisible: true

                    Row {
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom

                        FlatNavButton {
                            text: "Flat UI"
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            pointSize: 18
                        }

                        FlatNavButton {
                            text: "Menu item"
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            indicatorVisible: true
                        }

                        FlatNavDropdown {
                            text: "Messages"
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            dropdownHeight: 150
                            width: textWidth + 30
                        }

                        FlatNavButton {
                            text: "About us"
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                        }
                    }
                }

                Item {
                    // spacer
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 50
                }

                Row {
                    spacing: 200
                    Column {
                        spacing: 30
                        Text {
                            text: "Progress bars & Sliders"
                            width: contentWidth
                            height: contentHeight
                            color: FlatUI.midnightBlue
                            font {
                                family: FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        FlatProgressBar {
                            value: slider.value / 100
                        }

                        FlatSlider {
                            id: slider
                            tickCount: 0
                        }

                        FlatProgressCircle {
                            value: slider.value / 100
                        }
                    }

                    Column {
                        spacing: 50
                        Text {
                            text: "Navigation"
                            width: contentWidth
                            height: contentHeight
                            color: FlatUI.midnightBlue
                            font {
                                family: FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        Row {
                            spacing: 40

                            FlatIconNavBar {
                                width: iconButtonRow.width
                                Row {
                                    id: iconButtonRow
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom

                                    FlatIconButton {
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        text: FlatUI.glyphFont.clock
                                    }

                                    FlatIconButton {
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        text: FlatUI.glyphFont.camera
                                    }

                                    FlatIconButton {
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        text: FlatUI.glyphFont.heart
                                    }

                                    FlatIconButton {
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        text: FlatUI.glyphFont.eye
                                    }
                                }
                            }

                            FlatPillNavBar {}
                        }

                        FlatNumberNavBar {
                            count: 50
                            visibleCount: 8
                        }
                    }
                }

                Row {
                    spacing: 120
                    Column {
                        spacing: 20

                        Text {
                            text: "Checkboxes"
                            width: contentWidth
                            height: contentHeight
                            color: FlatUI.midnightBlue
                            font {
                                family: FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        FlatCheckBox {
                            text: "Unchecked"
                        }

                        FlatCheckBox {
                            text: "Checked"
                            checked: true
                        }

                        FlatCheckBox {
                            text: "Disabled unchecked"
                            enabled: false
                        }

                        FlatCheckBox {
                            text: "Disabled checked"
                            checked: true
                            enabled: false
                        }
                    }

                    Column {
                        spacing: 20

                        Text {
                            text: "Radio Buttons"
                            width: contentWidth
                            height: contentHeight
                            color: FlatUI.midnightBlue
                            font {
                                family: FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        ExclusiveGroup {
                            id: radioGroup
                        }

                        FlatRadioButton {
                            exclusiveGroup: radioGroup
                            text: "Radio is off"
                        }

                        FlatRadioButton {
                            exclusiveGroup: radioGroup
                            text: "Radio is on"
                            checked: true
                        }

                        FlatRadioButton {
                            exclusiveGroup: radioGroup
                            text: "Disabled radio is off"
                            enabled: false
                        }

                        FlatRadioButton {
                            exclusiveGroup: radioGroup
                            text: "Disabled radio is on"
                            checked: true
                            enabled: false
                        }
                    }

                    Column {
                        spacing: 20

                        Text {
                            text: "Switches"
                            width: contentWidth
                            height: contentHeight
                            color: FlatUI.midnightBlue
                            font {
                                family: FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        Row {
                            spacing: 30
                            FlatSwitch {}
                            FlatSwitch {checked: true}
                        }

                        Row {
                            spacing: 30
                            FlatBoxSwitch {}
                            FlatBoxSwitch {checked: true}
                        }

                        Row {
                            spacing: 30
                            FlatSwitch {enabled: false}
                            FlatSwitch {enabled: false}
                            FlatIconInput {
                                placeholderText: "Enter user name"
                                iconText: FlatUI.glyphFont.user
                            }

                            FlatIconInput {
                                placeholderText: "Enter password"
                                iconText: FlatUI.glyphFont.locked
                                echoMode: TextInput.Password
                            }
                        }
                    }
                }
            } // end mainLayout
        }
    }

    Component.onCompleted: {
        window.showMaximized()
    }
}
