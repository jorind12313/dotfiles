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

            // Center Clock (Anchored directly to window)
            ClockWidget {
                anchors.centerIn: parent
                z: 1
            }

            // Main Bar Row
            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 15
                anchors.rightMargin: 15

                // Left: Workspaces
                WorkspaceWidget {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                }

                // Flexible Spacer
                Item {
                    Layout.fillWidth: true
                }

                // Right: Audio & Battery
                RowLayout {
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    spacing: 15

                    AudioWidget {}
                    BatteryWidget {}
                }
            }
        }
    }
}
