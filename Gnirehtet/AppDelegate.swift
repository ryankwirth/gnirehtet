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
    
    let statusItem: NSStatusItem = {
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        item.button?.image = NSImage(named: "baseline_wifi_tethering_black_18pt")
        return item
    }()
    
    let menu: NSMenu = {
        let menu = NSMenu()
        menu.addItem(withTitle: "Gnirehtet", action: nil, keyEquivalent: "")
        menu.addItem(NSMenuItem.separator())
        menu.addItem(withTitle: "Hello World", action: #selector(helloWorld(_:)), keyEquivalent: "H")
        return menu
    }()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Hook up the menu to the statusItem
        statusItem.menu = menu
        
        // Start the relay server
        Relay.start()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // TODO
    }
    
    @objc func helloWorld(_ sender: Any?) {
        print("Hello World!")
    }
}
