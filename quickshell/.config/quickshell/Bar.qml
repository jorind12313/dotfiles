import QtQuick
import QtQuick.Layouts
import Quickshell
import "./widgets"

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 32
            color: "#1e1e2e"

            // 1. Perfectly centered clock anchored to parent
            ClockWidget {
                anchors.centerIn: parent
                z: 1 // Keep above background
            }

            // 2. Row layout for left & right sides only
            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 15
                anchors.rightMargin: 15

                // Left items (e.g. Workspaces placeholder)
                Item {
                    Layout.fillWidth: true
                }

                // Right Section: Audio + Battery
                RowLayout {
                    Layout.alignment: Qt.AlignRight
                    spacing: 15

                    AudioWidget {}
                    BatteryWidget {}
                }
            }
        }
    }
}
