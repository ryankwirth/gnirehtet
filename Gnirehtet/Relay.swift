//
//  Relay.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-23.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import Foundation

class Relay {
    
    static var daemon: Process?
    
    static func start() {
        daemon = RelayProcess.run("relay")
    }
    
    static func stop() {
        daemon?.terminate()
    }
    
    static func install(serial: String?) {
        RelayProcess.run("install", serial)
    }
    
    static func start(serial: String?) {
        RelayProcess.run("start", serial)
    }
    
    static func stop(serial: String?) {
        RelayProcess.run("stop", serial)
    }
    
    static func reset(serial: String?) {
        RelayProcess.run("tunnel", serial)
    }
}

class RelayProcess {
    
    // The name of the executable resource
    static let executable = "gnirehtet"
    
    @discardableResult
    static func run(_ args: String?...) -> Process {
        let task = Process()
        task.arguments = args.compactMap({ $0 })
        task.executableURL = Bundle.main.url(forResource: executable, withExtension: nil)
        task.currentDirectoryURL = Bundle.main.resourceURL
        task.launch()
        return task
    }
    
}
