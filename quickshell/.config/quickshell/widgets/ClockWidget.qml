import QtQuick
import "../services"

Item {
    id: root
    property var barWindow

    implicitWidth: label.implicitWidth
    implicitHeight: label.implicitHeight

    Text {
        id: label
        text: Time.time
        color: hover.hovered ? "#f9e2af" : "#ffffff"
        font.pixelSize: 14
        font.family: "JetBrainsMono Nerd Font"
        renderType: Text.NativeRendering

        Behavior on color {
            ColorAnimation { duration: 150 }
        }
    }

    HoverHandler { id: hover }

    CalendarWidget {
        id: calendar
        parentWindow: barWindow
        open: hover.hovered || calendar.hovered

        relativeX: root.x + (root.width - calendar.implicitWidth) / 2
        relativeY: root.y + root.height + 8
    }
}
