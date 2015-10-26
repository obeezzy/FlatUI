/*
    Copyright (C) 2011 Jocelyn Turcotte <turcotte.j@gmail.com>

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Library General Public License for more details.

    You should have received a copy of the GNU Library General Public License
    along with this program; see the file COPYING.LIB.  If not, write to
    the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
    Boston, MA 02110-1301, USA.
*/

import QtQuick 1.1

Item {
    id: container
    property alias text: toolTipText.text
    property Item sourceItem
    property variant mappedPos: "0, 0"

    x: mappedPos.x
    y: mappedPos.y + 15
    opacity: sourceItem ? 1.0 : 0.0

    onSourceItemChanged: {
        if (sourceItem) {
            text = sourceItem.toolTipText
            mappedPos = parent.mapFromItem(sourceItem, sourceItem.toolTipPos.x, sourceItem.toolTipPos.y)
        }
    }
    Connections {
        target: container.sourceItem
        onToolTipTextChanged: container.text = container.sourceItem.toolTipText
        onToolTipPosChanged: container.mappedPos = container.parent.mapFromItem(container.sourceItem, container.sourceItem.toolTipPos.x, container.sourceItem.toolTipPos.y)
    }

    width: toolTipText.paintedWidth + 20
    height: toolTipText.paintedHeight + 20
    Behavior on opacity { NumberAnimation { } }
    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.8
        radius: 5
        Text {
            id: toolTipText
            x: 10
            y: (parent.height - toolTipText.paintedHeight) / 2
            width: 350
            color: "white"
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
        }
    }
}
