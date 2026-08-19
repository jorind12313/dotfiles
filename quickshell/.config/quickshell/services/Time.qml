pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    // SystemClock updates automatically based on precision
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    // Dynamic property bound directly to the clock's date
    readonly property string time: Qt.formatDateTime(clock.date, "MMM d HH:mm")
}
