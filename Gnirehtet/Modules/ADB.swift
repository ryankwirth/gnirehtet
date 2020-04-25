//
//  ADB.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-24.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import Foundation

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
    
    private func parseDevice(_ output: String) {
        print("Device: \(output)")
    }
}

extension ADB: USBWatcherDelegate {
    func notify() {
        // Run `adb devices -l`
        if let output = Process.output(.adb, "devices", "-l") {
            // Parse each line individually
            output.enumerateLines { line, _ in
                self.parseDevice(line)
            }
        }
    }
}
