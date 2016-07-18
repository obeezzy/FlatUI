TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

RESOURCES +=

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    main.qml \
    flatui/FlatUI.qml \
    flatui/HorizontalScrollBar.qml \
    flatui/VerticalScrollBar.qml \
    flatui/qmldir \
    flatui/Button.qml \
    flatui/PrimaryButton.qml \
    flatui/WarningButton.qml \
    flatui/DangerButton.qml \
    flatui/DefaultButton.qml \
    flatui/InfoButton.qml \
    flatui/InverseButton.qml \
    flatui/SuccessButton.qml \
    flatui/ButtonStyle.qml \
    flatui/InputStyle.qml \
    flatui/Style.qml \
    flatui/Input.qml \
    flatui/Dropdown.qml \
    flatui/Select.qml \
    flatui/CheckBox.qml \
    flatui/RadioButton.qml \
    flatui/IconButton.qml \
    flatui/IconInput.qml \
    flatui/Switch.qml \
    flatui/SwitchStyle.qml \
    flatui/Slider.qml \
    flatui/SliderStyle.qml \
    flatui/BoxSwitch.qml \
    flatui/NavButton.qml \
    flatui/ImageCircle.qml \
    flatui/IconNavBar.qml \
    flatui/NumberNavBar.qml \
    flatui/NumberNavButton.qml \
    flatui/PillNavBar.qml \
    flatui/ProgressBar.qml \
    flatui/ProgressCircle.qml \
    flatui/SearchInput.qml \
    flatui/Sidebar.qml \
    flatui/ToolTip.qml \
    flatui/TopNavBar.qml \
    flatui/NavDropdown.qml
