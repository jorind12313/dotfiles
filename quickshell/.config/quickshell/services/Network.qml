pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton{
  id:root

  property bool connected: false
  property string ssid: ""
  property int strength: 0

  Process {
    id: nmcli
    command: ["nmcli", "-t", "-f", "active,ssid,signal", "dev","wifi"]

    stdout: StdioCollector {
      onStreamFinished:{
        
       const lines = text.trim().split("\n")
       const activeLine = lines.find(line => line.startsWith("yes:"))
       const parts = activeLine.split(":")

       if (activeLine){
          
        root.connected = true
        root.ssid = parts[1]
        root.strength = parseInt(parts[2])
       }else{
         root.connected = false
       }

      }
    }
  }
  Component.onCompleted: nmcli.running = true

  Timer{
    interval: 5000
    running: true
    repeat: true
    onTriggered: nmcli.running = true
  }
}
