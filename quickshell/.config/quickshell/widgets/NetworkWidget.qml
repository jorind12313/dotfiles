import QtQuick
import "../services/"

Text{
  text: Network.connected ? "󰤨" +" " + Network.strength + "%": "󰤭 Disconnected"
  color: Network.strength == 0 ? "#ff0000" : "#ffffff"
  font.pixelSize: 13
  font.family: "JetBrainsMono Nerd Font"
}
