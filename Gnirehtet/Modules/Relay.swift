//
//  Relay.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-23.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import Foundation

// Configuration for the executable resources
let executableName = "gnirehtet"
let resourcePath = Bundle.main.resourcePath!

class Relay {
    
    var daemon: Process?
    
    func start() {
        daemon = Relay.run("relay")
    }
    
    func stop() {
        daemon?.terminate()
    }
    
    func install(serial: String?) {
        Relay.run("install", serial)
    }
    
    func start(serial: String?) {
        Relay.run("start", serial)
    }
    
    func stop(serial: String?) {
        Relay.run("stop", serial)
    }
    
    func reset(serial: String?) {
        Relay.run("tunnel", serial)
    }
    
    @discardableResult
    static func run(_ args: String?...) -> Process {
        let task = Process()
        task.arguments = args.compactMap({ $0 })
        task.executableURL = Bundle.main.url(forResource: executableName, withExtension: nil)
        task.currentDirectoryPath = resourcePath
        task.environment = ["PATH": resourcePath]
        task.launch()
        return task
    }
}
