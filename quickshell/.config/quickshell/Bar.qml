import QtQuick
import QtQuick.Layouts
import Quickshell
import "./widgets"

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: barWindow
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 34

            color: "#991e1e2e"

            RowLayout {
                anchors {
                    left: parent.left
                    leftMargin: 14
                    verticalCenter: parent.verticalCenter
                }
                
                StartMenuWidget {}
                WorkspaceWidget {}
            }

            ClockWidget {
                anchors.centerIn: parent
                z: 1
                barWindow: barWindow
            }

            RowLayout {
                anchors {
                    right: parent.right
                    rightMargin: 14
                    verticalCenter: parent.verticalCenter
                }
                spacing: 16

                AudioWidget {}
                BatteryWidget {}
                NetworkWidget {}
              }

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




