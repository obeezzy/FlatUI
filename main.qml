import QtQuick 2.4
import QtQuick.Window 2.2
import "flatui" as Flat
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4 as OldControls

ApplicationWindow {
    id: window
    visible: true
    width: 680
    height: 480

    OldControls.ScrollView {
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
                color: Flat.FlatUI.midnightBlue
                font {
                    family: Flat.FlatUI.latoBlackFont.name
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
                    color: Flat.FlatUI.midnightBlue
                    font {
                        family: Flat.FlatUI.latoRegularFont.name
                        bold: true
                        pointSize: 30
                    }
                }

                Text {
                    text: "Buttons"
                    width: contentWidth
                    height: contentHeight
                    color: Flat.FlatUI.midnightBlue
                    font {
                        family: Flat.FlatUI.latoRegularFont.name
                        bold: true
                        pointSize: 18
                    }
                }

                Grid {
                    columns: 4
                    rows: 4
                    rowSpacing: 40
                    columnSpacing: 40

                    Flat.PrimaryButton {}
                    Flat.WarningButton {}
                    Flat.DefaultButton {}
                    Flat.DangerButton {}
                    Flat.SuccessButton {}
                    Flat.InverseButton {}
                    Flat.InfoButton {}
                    Flat.PrimaryButton {enabled: false; text: "Disabled Button"}
                }

                Text {
                    text: "Input"
                    width: contentWidth
                    height: contentHeight
                    color: Flat.FlatUI.midnightBlue
                    font {
                        family: Flat.FlatUI.latoRegularFont.name
                        bold: true
                        pointSize: 18
                    }
                }

                Row {
                    spacing: 20

                    Flat.Input {placeholderText: "Inactive"}
                    Flat.Input {style.name: "error"; text: "Error"}
                    Flat.Input {style.name: "success"; text: "Success"}
                    Flat.Input {enabled: false; text: "Disabled"}
                }

                Row {
                    spacing: 200

                    Column {
                        spacing: 30
                        Text {
                            text: "Dropdown"
                            width: contentWidth
                            height: contentHeight
                            color: Flat.FlatUI.midnightBlue
                            font {
                                family: Flat.FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        Flat.Dropdown {
//                            text: "Default";
//                            dropdownHeight: 150

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
                            color: Flat.FlatUI.midnightBlue
                            font {
                                family: Flat.FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        Flat.Select {
                            model: ["Spider-man", "Superman", "Batman"]
                        }
                    }
                }


                Text {
                    text: "Navbar"
                    width: contentWidth
                    height: contentHeight
                    color: Flat.FlatUI.midnightBlue
                    font {
                        family: Flat.FlatUI.latoRegularFont.name
                        bold: true
                        pointSize: 18
                    }
                }

                Flat.TopNavBar {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    //searchBarVisible: true

                    Row {
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom

                        Flat.NavButton {
                            text: "Flat UI"
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            style.icon.font.pointSize: 18
                            //pointSize: 18
                        }

                        Flat.NavButton {
                            text: "Menu item"
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            //indicatorVisible: true
                        }

                        Flat.NavDropdown {
                            //text: "Messages"
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            //dropdownHeight: 150
                            //width: textWidth + 30
                        }

                        Flat.NavButton {
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
                            color: Flat.FlatUI.midnightBlue
                            font {
                                family: Flat.FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        Flat.ProgressBar {
                            value: slider.value / 100
                        }

                        Flat.Slider {
                            id: slider
                            //tickCount: 0
                        }

                        Flat.ProgressCircle {
                            value: slider.value / 100
                        }
                    }

                    Column {
                        spacing: 50
                        Text {
                            text: "Navigation"
                            width: contentWidth
                            height: contentHeight
                            color: Flat.FlatUI.midnightBlue
                            font {
                                family: Flat.FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        Row {
                            spacing: 40

                            Flat.IconNavBar {
                                width: iconButtonRow.width
                                Row {
                                    id: iconButtonRow
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom

                                    Flat.IconButton {
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        text: Flat.FlatUI.glyphFont.clock
                                    }

                                    Flat.IconButton {
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        text: Flat.FlatUI.glyphFont.camera
                                    }

                                    Flat.IconButton {
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        text: Flat.FlatUI.glyphFont.heart
                                    }

                                    Flat.IconButton {
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        text: Flat.FlatUI.glyphFont.eye
                                    }
                                }
                            }

                            Flat.PillNavBar {}
                        }

                        Flat.NumberNavBar {
                            //count: 50
                            //visibleCount: 8
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
                            color: Flat.FlatUI.midnightBlue
                            font {
                                family: Flat.FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        Flat.CheckBox {
                            text: "Unchecked"
                        }

                        Flat.CheckBox {
                            text: "Checked"
                            checked: true
                        }

                        Flat.CheckBox {
                            text: "Disabled unchecked"
                            enabled: false
                        }

                        Flat.CheckBox {
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
                            color: Flat.FlatUI.midnightBlue
                            font {
                                family: Flat.FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        ButtonGroup { id: radioGroup }

                        Flat.RadioButton {
                            ButtonGroup.group: radioGroup
                            text: "Radio is off"
                        }

                        Flat.RadioButton {
                            ButtonGroup.group: radioGroup
                            text: "Radio is on"
                            checked: true
                        }

                        Flat.RadioButton {
                            ButtonGroup.group: radioGroup
                            text: "Disabled radio is off"
                            enabled: false
                        }

                        Flat.RadioButton {
                            ButtonGroup.group: radioGroup
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
                            color: Flat.FlatUI.midnightBlue
                            font {
                                family: Flat.FlatUI.latoRegularFont.name
                                bold: true
                                pointSize: 18
                            }
                        }

                        Row {
                            spacing: 100
                            Flat.Switch {}
                            Flat.Switch {checked: true}
                        }

                        Row {
                            spacing: 100
                            Flat.BoxSwitch {}
                            Flat.BoxSwitch {checked: true}
                        }

                        Row {
                            spacing: 100
                            Flat.Switch {enabled: false}
                            Flat.Switch {enabled: false}

                        }

                        Row {
                            spacing: 30
                            Flat.IconInput {
                                placeholderText: "Enter user name"
                                style.icon.font.family: Flat.FlatUI.glyphFont.name
                                style.icon.text: Flat.FlatUI.glyphFont.user
                            }

                            Flat.IconInput {
                                placeholderText: "Enter password"
                                style.icon.font.family: Flat.FlatUI.glyphFont.name
                                style.icon.text: Flat.FlatUI.glyphFont.locked
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
