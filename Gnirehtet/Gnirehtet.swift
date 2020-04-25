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
    private var adb: ADB?
    private var relay: Relay?
    private var menuBarExtra: MenuBarExtra?
    
    init() {
        // Initialize each module
        adb = ADB(delegate: self)
        relay = Relay()
        menuBarExtra = MenuBarExtra()
        
        // Start the relay
        // relay?.start()
    }
    
    deinit {
        relay?.stop()
        adb = nil
        relay = nil
        menuBarExtra = nil
    }
}

extension Gnirehtet: ADBDelegate {
    func addedDevice(_ device: Device) {
        print("Added: \(device)")
    }
    
    func removedDevice(_ device: Device) {
        print("Removed: \(device)")
    }
}
