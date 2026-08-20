pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    readonly property string time: Qt.formatDateTime(clock.date, "MMM d HH:mm")
    readonly property date date: clock.date
}
