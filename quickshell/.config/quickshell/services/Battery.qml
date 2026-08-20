pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton {
    id: root

    // Referencing UPower.devices forces device enumeration over D-Bus;
    // without it, displayDevice never populates and stays unready.
    property var _devices: UPower.devices

    readonly property var device: UPower.displayDevice
    readonly property int percentage: device ? Math.round(device.percentage * 100) : 100
    readonly property bool isCharging: device ? device.state === UPowerDeviceState.Charging : false
}
