//
//  Gnirehtet.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-24.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

class Gnirehtet {
    
    var adb: ADB?
    var relay: Relay?
    var menuBarExtra: MenuBarExtra?
    
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
    func deviceAdded(serial: String) {
        // TODO
    }
    
    func deviceRemoved(serial: String) {
        // TODO
    }
}
