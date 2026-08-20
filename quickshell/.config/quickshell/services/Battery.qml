pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton {
    id: root

    property var _devices: UPower.devices

    readonly property var device: UPower.displayDevice
    readonly property int percentage: device ? Math.round(device.percentage * 100) : 100
    readonly property bool isCharging: device ? device.state === UPowerDeviceState.Charging : false
}
