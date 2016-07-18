import QtQuick 2.7
import "."

Item {
    id: root
    width: 240
    height: 240

    property real maximumValue: 1.0
    property real minimumValue: 0.0
    property real value: .5

    Timer {
        id: updateTimer
        repeat: true
        running: true
        interval: 50

        onTriggered: {
            //repeat = root.incrementValue()
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: 5 * parent.width / 8
        height: width
        radius: width / 2
        color: "transparent"
        border.width: 10
        border.color: FlatUI.clouds
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        antialiasing: true

        onPaint: {
            var ctx = getContext('2d');
            var imd = null;
            var circ = Math.PI * 2;
            var quart = Math.PI / 2;

            ctx.clearRect(0, 0, root.width, root.height)
            ctx.beginPath();
            ctx.strokeStyle = FlatUI.emerald
            ctx.lineCap = 'square';
            ctx.closePath();
            ctx.fill();
            ctx.lineWidth = 10.0;

            imd = ctx.getImageData(0, 0, canvas.width, canvas.height);

            var current = root.value
            ctx.putImageData(imd, 0, 0);
            ctx.beginPath();
            //ctx.arc(120, 120, 70, -(quart), ((circ) * current) - quart, false);
            ctx.arc(canvas.width / 2, canvas.height / 2, 70, -(quart), ((circ) * current) - quart, false)
            ctx.stroke();
        }
    }

    Text {
        anchors.centerIn: parent
        width: contentWidth
        height: contentHeight
        text: Math.floor(root.value * 100) + "%"
        color: FlatUI.midnightBlue
        font.pixelSize: 30
        font.family: FlatUI.latoLightFont.name
    }

    function incrementValue() {
        if(root.value >= root.maximumValue)
            return false
        root.value += .01
        canvas.requestPaint()

        return true
    }

    onValueChanged: canvas.requestPaint()
}

