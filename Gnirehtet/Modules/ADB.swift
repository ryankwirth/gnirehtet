//
//  ADB.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-24.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import IOKit
import IOKit.usb
import IOKit.usb.IOUSBLib

protocol ADBDelegate: class {
    func deviceAdded(serial: String)
    func deviceRemoved(serial: String)
}

class ADB {
    private weak var delegate: ADBDelegate?
    private var usbWatcher: USBWatcher?
    
    init(delegate: ADBDelegate) {
        self.delegate = delegate
        usbWatcher = USBWatcher(delegate: self)
    }
    
}

extension ADB: USBWatcherDelegate {
    func notify() {
        print("Notify!")
    }
}
