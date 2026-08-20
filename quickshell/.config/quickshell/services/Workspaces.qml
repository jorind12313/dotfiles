pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property int activeWorkspace: 1
    property int count: 9

    function setWorkspace(index) {
        viewProc.command = ["mmsg", "dispatch", "view," + index]
        viewProc.running = true
    }

    // One-shot dispatcher for switching tags
    Process {
        id: viewProc
        running: false
    }

    // Long-running watcher that streams tag state from mango's IPC socket
    Process {
        id: watchProc
        command: ["mmsg", "watch", "all-tags"]
        running: true

        onExited: restartTimer.start()

        stdout: SplitParser {
            onRead: data => {
                let parsed
                try {
                    parsed = JSON.parse(data)
                } catch (e) {
                    return
                }

                const mon = parsed.all_tags?.[0]
                if (!mon || !mon.tags) return

                root.count = mon.tags.length

                const active = mon.tags.find(t => t.is_active)
                if (active) root.activeWorkspace = active.index
            }
        }
    }

    // If mango restarts (SUPER+R) the socket drops and mmsg exits; reconnect
    Timer {
        id: restartTimer
        interval: 1000
        onTriggered: watchProc.running = true
    }
}
