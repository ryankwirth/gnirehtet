//
//  Process+Executable.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-24.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import Foundation

extension Process {
    @discardableResult
    static func run(_ executable: Executable, pipe: Pipe?, args: [String]) -> Process {
        let task = Process()
        task.executableURL = executable.url
        task.standardOutput = pipe
        task.arguments = args
        
        // Configure environment variables
        task.currentDirectoryPath = Resources.basePath
        task.environment = ["PATH": Resources.basePath]
        
        task.launch()
        return task
    }
    
    @discardableResult
    static func run(_ executable: Executable, _ args: String...) -> Process {
        return run(executable, pipe: nil, args: args)
    }
    
    static func output(_ executable: Executable, _ args: String...) -> String? {
        let pipe = Pipe()
        
        // Run the executable and wait for it to finish
        let task = run(executable, pipe: pipe, args: args)
        task.waitUntilExit()
        
        // Return the data from the pipe as a String
        let handle = pipe.fileHandleForReading
        let data = handle.readDataToEndOfFile()
        return String(data: data, encoding: .utf8)
    }
}
