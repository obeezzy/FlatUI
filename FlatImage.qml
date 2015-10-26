import QtQuick 2.4
import QtGraphicalEffects 1.0 // Do not forget to import!

Rectangle {
    id: root
    width: 360
    height: 360
    color: "transparent"

    property alias source: image.source

    FlatConstants {
        id: flatConstants
    }

    Rectangle {
        id: background
        anchors.fill: parent
        anchors.margins: 2
        color: "transparent"
        border.color: flatConstants.clouds
        border.width: 2
        radius: width
        z: 1
    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        visible: false // Do not forget to make original pic invisible
    }

    Rectangle {
        id: mask
        anchors { fill: parent; margins: 2 }
        radius: width / 2
        clip: true
        visible: false
    }

    OpacityMask {
        anchors.fill: mask
        source: image
        maskSource: mask
    }
}

//import QtQuick 2.4

//Rectangle {
//    width: 200
//    height: 200

//    color: "transparent"

//    property alias source: image.source

//    //this Rectangle is needed to keep the source image's fillMode
//    Rectangle {
//        id: imageSource

//        anchors.fill: parent
//        Image {
//            id: image
//            anchors.fill: parent
//            fillMode: Image.PreserveAspectCrop
//        }
//        visible: false

//        layer.enabled: true
//    }

//    Rectangle {
//        id: maskLayer
//        anchors.fill: parent
//        radius: 6 //parent.width / 2

//        color: "red"

//        border.color: "black"

//        layer.enabled: true
//        layer.samplerName: "maskSource"
//        layer.effect: ShaderEffect {

//            property var colorSource: imageSource
//            fragmentShader: "
//                uniform lowp sampler2D colorSource;
//                uniform lowp sampler2D maskSource;
//                uniform lowp float qt_Opacity;
//                varying highp vec2 qt_TexCoord0;
//                void main() {
//                    gl_FragColor =
//                        texture2D(colorSource, qt_TexCoord0)
//                        * texture2D(maskSource, qt_TexCoord0).a
//                        * qt_Opacity;
//                }
//            "
//        }

//    }

//    // only draw border line
//    Rectangle {
//        anchors.fill: parent

//        radius: parent.width / 2

//        border.color: "black"
//        border.width: 2

//        color: "transparent"
//    }
//}
