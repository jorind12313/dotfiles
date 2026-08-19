import QtQuick
import "../services"

Text {
    text: (Audio.isMuted ? "󰝟 " : "󰕾 ") + Audio.volume + "%"
    color: Audio.isMuted ? "#f38ba8" : "#a6e3a1"
    font.pixelSize: 13
    font.family: "JetBrainsMono Nerd Font"

}
