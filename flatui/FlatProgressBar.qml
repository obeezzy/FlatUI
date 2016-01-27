import QtQuick 2.4
import QtQuick.Controls 1.2
import "."

Item {
    id: root
    width: 400
    height: 13
    smooth: true

    property int radius: 8
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

    Canvas {
        id: canvas
        anchors.fill: parent
        antialiasing: true

        function roundRect(ctx, x, y, width, height, radius) {
            ctx.fillStyle = FlatUI.clouds
            ctx.beginPath();
            ctx.moveTo(x + radius, y);
            ctx.lineTo(x + width - radius, y);
            ctx.arc(x + width - radius, y + radius, radius, -Math.PI / 2, Math.PI / 2, false);
            ctx.lineTo(x + radius, y + height);
            ctx.arc(x + radius, y + radius, radius, Math.PI / 2, 3*Math.PI / 2, false);
            ctx.closePath();
            ctx.fill();
        }

        function progressBarRect(ctx, x, y, width, height, radius, max) {
            // deplacement for chord drawing
            var offset = 0;
            ctx.fillStyle = FlatUI.turquoise
            ctx.beginPath();
            if (width<radius) {
                offset = radius - Math.sqrt(Math.pow(radius, 2) - Math.pow((radius - width), 2));
                // Left angle
                var left_angle = Math.acos((radius - width) / radius);
                ctx.moveTo(x + width, y + offset);
                ctx.lineTo(x + width, y + height-offset);
                ctx.arc(x + radius, y + radius, radius, Math.PI - left_angle, Math.PI + left_angle, false);
            }
            else if (width + radius > max) {
                offset = radius - Math.sqrt(Math.pow(radius, 2)-Math.pow((radius - (max - width)), 2));
                // Right angle
                var right_angle = Math.acos((radius - (max - width)) / radius);
                ctx.moveTo(x + radius, y);
                ctx.lineTo(x + width, y);
                ctx.arc(x + max - radius, y + radius, radius, -Math.PI / 2, -right_angle, false);
                ctx.lineTo(x + width, y + height - offset);
                ctx.arc(x + max - radius, y + radius, radius, right_angle, Math.PI / 2, false);
                ctx.lineTo(x + radius, y + height);
                ctx.arc(x + radius, y + radius, radius, Math.PI / 2, 3 * Math.PI / 2, false);
            }
            else {
                ctx.moveTo(x + radius, y);
                ctx.lineTo(x + width, y);
                ctx.lineTo(x + width, y + height);
                ctx.lineTo(x + radius, y + height);
                ctx.arc(x + radius, y + radius, radius, Math.PI / 2, 3 * Math.PI / 2, false);
            }
            ctx.closePath();
            ctx.fill();
        }

        onPaint: {
            var ctx = getContext('2d')
            ctx.clearRect(0, 0, root.width, root.height)
            roundRect(ctx, 0, 0, width, height, root.radius)
            progressBarRect(ctx, 0, 0, root.value * width, height, root.radius, width)
        }
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

