//
//  ADB.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-24.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import Foundation

private let MAX_ATTEMPTS = 5
private let ATTEMPT_DELAY = 1.0

protocol ADBDelegate: class {
    func onDeviceAdded(_ device: Device)
    func onDeviceRemoved(_ device: Device)
}

class ADB {
    private weak var delegate: ADBDelegate?
    private var usbWatcher: USBWatcher?
    private(set) var devices = [Device]()
    
    init(delegate: ADBDelegate) {
        self.delegate = delegate
        usbWatcher = USBWatcher(delegate: self)
    }
    
    private func detectDevices(attempt: Int = 1) {
        // Run `adb devices -l`
        guard let output = Process.output(.adb, "devices", "-l") else { return }
        
        // Parse the output into Device structs
        let currentDevices = output.split { $0.isNewline }
            .map(String.init)
            .compactMap(Device.init)
        
        // Compute the changes in the sets of devices
        let differences = currentDevices.difference(from: devices)
        devices = currentDevices
        
        if !differences.isEmpty {
            // Inform the delegate of all changes
            for difference in differences {
                switch difference {
                case .insert(offset: _, element: let device, associatedWith: _):
                    delegate?.onDeviceAdded(device)
                case .remove(offset: _, element: let device, associatedWith: _):
                    delegate?.onDeviceRemoved(device)
                }
            }
        } else if attempt < MAX_ATTEMPTS {
            // Try again after a short delay
            DispatchQueue.main.asyncAfter(deadline: .now() + ATTEMPT_DELAY) {
                self.detectDevices(attempt: attempt + 1)
            }
        }
    }
}

extension ADB: USBWatcherDelegate {
    func notify() {
        DispatchQueue.main.async {
            self.detectDevices()
        }
    }
}
