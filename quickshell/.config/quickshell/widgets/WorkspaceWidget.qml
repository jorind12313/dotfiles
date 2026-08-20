import QtQuick
import QtQuick.Layouts
import "../services"

RowLayout {
    spacing: 12

    Repeater {
        model: Workspaces.count

        Rectangle {
            id: tagDot
            
            property int wsIndex: index + 1
            property bool isActive: Workspaces.activeWorkspace === wsIndex

            implicitWidth: 24
            implicitHeight: 24
            radius: 4
            color: isActive ? "#cba6f7" : "transparent" // Catppuccin Mauve highlight

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




