import QtQuick
import "../services"

Text {
    text: (Battery.isCharging ? "󰂄 " : "󰁹 ") + Battery.percentage + "%"
    color: Battery.percentage < 20 ? "#f38ba8" : "#f9e2af"
    font.pixelSize: 13
    font.family: "JetBrainsMono Nerd Font"
}
