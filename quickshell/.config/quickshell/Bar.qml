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

            implicitHeight: 34

            // Frosted glass: a translucent fill lets mango's compositor-side
            // blur (blur=1 / blur_layer=1 in mango config.conf) show through.
            color: "#cc1e1e2e"

            // Left: workspaces
            RowLayout {
                anchors {
                    left: parent.left
                    leftMargin: 14
                    verticalCenter: parent.verticalCenter
                }

                WorkspaceWidget {}
            }

            // Center: clock
            ClockWidget {
                anchors.centerIn: parent
                z: 1
            }

            // Right: volume + battery
            RowLayout {
                anchors {
                    right: parent.right
                    rightMargin: 14
                    verticalCenter: parent.verticalCenter
                }
                spacing: 16

                AudioWidget {}
                BatteryWidget {}
            }

            // Subtle edge to separate the bar from blurred content beneath it
            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                height: 1
                color: "#33cdd6f4"
            }
          }
        }
      }




