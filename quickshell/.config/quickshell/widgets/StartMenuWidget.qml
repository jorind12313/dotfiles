import QtQuick
import Quickshell

Item {
  id: root

  implicitWidth: 24
  implicitHeight: 24

  Rectangle{
    id: button
    anchors.fill: parent
    radius: 4
    color: hoverHandler.hovered ? "#cba6f7" : "transparent"

    Behavior on color {
      ColorAnimation { duration: 150}
    }
    
    Text { 
      anchors.centerIn: parent
      text: "󰣇"
      color: hoverHandler.hovered ? "#11111b" : "#cdd6f4"
      font.pixelSize: 14
      font.family: "JetBrainsMono Nerd Font"
      renderType: Text.NativeRendering

      Behavior on color {
        ColorAnimation { duration: 150 }
      }
    }
  }

  HoverHandler { id: hoverHandler}

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: Quickshell.execDetached(["rofi", "-show", "drun", "-location", "1", "-xoffset", "14", "-yoffset", "38"])
  }
}
