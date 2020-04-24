//
//  AppDelegate.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-23.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let relay = Relay()
    let menuBarExtra = MenuBarExtra()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Start the relay server
        relay.start()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Kill the relay server
        relay.stop()
    }
    
}
