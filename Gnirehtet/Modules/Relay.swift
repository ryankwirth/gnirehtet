//
//  Relay.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-23.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import Foundation

class Relay {
    private var daemon: Process?
    
    func launch() {
        daemon = Process.run(.gnirehtet, "relay")
    }
    
    func kill() {
        daemon?.terminate()
    }
    
    func start(serial: String) {
        Process.run(.gnirehtet, "start", serial)
    }
    
    func stop(serial: String) {
        Process.run(.gnirehtet, "stop", serial)
    }
}
