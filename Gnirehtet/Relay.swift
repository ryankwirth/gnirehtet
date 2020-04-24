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
    
    static var executableURL: URL? {
        return Bundle.main.url(forResource: "gnirehtet", withExtension: "")
    }
    
    @discardableResult
    static func run(_ args: String?...) -> Process {
        let task = Process()
        task.executableURL = executableURL
        task.arguments = args.compactMap({ $0 })
        task.launch()
        task.waitUntilExit()
        print(task.terminationStatus)
        return task
    }
    
}
