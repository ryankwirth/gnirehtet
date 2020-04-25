//
//  Gnirehtet.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-24.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import IOKit
import IOKit.usb
import IOKit.usb.IOUSBLib

class Gnirehtet {
    private var adb: ADB!
    private var relay = Relay()
    private var usbWatcher: USBWatcher!
    private var menuBarExtra = MenuBarExtra()
    
    init() {
        adb = ADB(delegate: self)
        usbWatcher = USBWatcher(delegate: self)
        
        // Start the relay and search for devices
        refresh()
        relay.launch()
        adb.detectDevices()
    }
    
    deinit {
        for device in adb.devices {
            relay.stop(serial: device.serial)
        }
        
        relay.kill()
    }
    
    func refresh() {
        menuBarExtra.refresh(with: adb.devices)
    }
}

extension Gnirehtet: ADBDelegate {
    func onDeviceAdded(_ device: Device) {
        relay.start(serial: device.serial)
        refresh()
    }
    
    func onDeviceRemoved(_ device: Device) {
        refresh()
    }
}

extension Gnirehtet: USBWatcherDelegate {
    func onUSBDevicesChanged() {
        adb.detectDevices()
    }
}
