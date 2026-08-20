import QtQuick
import QtQuick.Layouts
import "../services"

Item {
    id: root

    readonly property bool expanded: hoverHandler.hovered
    readonly property int windowSize: Math.min(5, Workspaces.count)

    readonly property int windowStart: {
        const maxStart = Math.max(1, Workspaces.count - windowSize + 1)
        const centered = Workspaces.activeWorkspace - Math.floor(windowSize / 2)
        return Math.min(Math.max(centered, 1), maxStart)
    }

    implicitWidth: expanded ? expandedRow.implicitWidth : collapsedDot.implicitWidth
    implicitHeight: 24

    Behavior on implicitWidth {
        NumberAnimation { duration: 140; easing.type: Easing.OutQuad }
    }

    HoverHandler {
        id: hoverHandler
    }

    Rectangle {
        id: collapsedDot
        visible: !root.expanded
        anchors.verticalCenter: parent.verticalCenter
        implicitWidth: 24
        implicitHeight: 24
        radius: 4
        color: "#cba6f7"

        Text {
            anchors.centerIn: parent
            text: Workspaces.activeWorkspace
            color: "#11111b"
            font.pixelSize: 13
            font.weight: Font.Bold
            font.family: "JetBrainsMono Nerd Font"
            renderType: Text.NativeRendering
        }
    }

    RowLayout {
        id: expandedRow
        visible: root.expanded
        anchors.verticalCenter: parent.verticalCenter
        spacing: 8

        Repeater {
            model: root.windowSize

            Rectangle {
                id: tagDot

                property int wsIndex: root.windowStart + index
                property bool isActive: Workspaces.activeWorkspace === wsIndex

                implicitWidth: 24
                implicitHeight: 24
                radius: 4
                color: isActive ? "#cba6f7" : "transparent"

                Text {
                    anchors.centerIn: parent
                    text: parent.wsIndex
                    color: parent.isActive ? "#11111b" : "#a6adc8"
                    font.pixelSize: 13
                    font.weight: parent.isActive ? Font.Bold : Font.Normal
                    font.family: "JetBrainsMono Nerd Font"
                    renderType: Text.NativeRendering
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: Workspaces.setWorkspace(parent.wsIndex)
                }

                Behavior on color {
                    ColorAnimation { duration: 150 }
                }
            }
        }
    }
}
