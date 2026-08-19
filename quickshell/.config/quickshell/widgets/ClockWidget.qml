import QtQuick
import "../services"

Text {
    // Access the Singleton directly
    text: Time.time
    color: "#ffffff"
    font.pixelSize: 14
    font.family: "JetBrainsMono Nerd Font"
    renderType: Text.NativeRendering
}
