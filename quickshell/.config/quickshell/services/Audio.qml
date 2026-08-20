pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    id: root

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property real volume: sink?.audio?.volume !== undefined ? Math.round(sink.audio.volume * 100) : 0
    readonly property bool isMuted: sink?.audio?.muted ?? false
}
