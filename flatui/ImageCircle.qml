import QtQuick 2.4
import "."

Rectangle {
    width: 200
    height: 200

    color: "transparent"

    property alias source: image.source

    //this Rectangle is needed to keep the source image's fillMode
    Rectangle {
        id: imageSource

        anchors.fill: parent
        Image {
            id: image
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
        }
        visible: false

        layer.enabled: true
    }

    Rectangle {
        id: maskLayer
        anchors.fill: parent
        radius: 6 //parent.width / 2

        color: "red"

        border.color: "black"

        layer.enabled: true
        layer.samplerName: "maskSource"
        layer.effect: ShaderEffect {

            property var colorSource: imageSource
            fragmentShader: "
                uniform lowp sampler2D colorSource;
                uniform lowp sampler2D maskSource;
                uniform lowp float qt_Opacity;
                varying highp vec2 qt_TexCoord0;
                void main() {
                    gl_FragColor =
                        texture2D(colorSource, qt_TexCoord0)
                        * texture2D(maskSource, qt_TexCoord0).a
                        * qt_Opacity;
                }
            "
        }

    }

    // only draw border line
//    Rectangle {
//        anchors.fill: parent

//        radius: parent.width / 2

//        border.color: "black"
//        border.width: 2

//        color: "transparent"
//    }
}
