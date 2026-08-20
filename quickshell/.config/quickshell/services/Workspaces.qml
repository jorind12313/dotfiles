pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property int activeWorkspace: 1
    readonly property int count: 5

    function setWorkspace(index) {
        activeWorkspace = index
        tagProc.command = ["mango", "tag", index.toString()]
        tagProc.running = true
    }

    Process {
        id: tagProc
        running: false
    }
}




