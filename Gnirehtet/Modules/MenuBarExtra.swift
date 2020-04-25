//
//  MenuBarExtra.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-24.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import Cocoa

class MenuBarExtra {
    
    let statusItem: NSStatusItem = {
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        item.button?.image = NSImage(named: "baseline_usb_black_18pt")
        return item
    }()
    
    let menu: NSMenu = {
        let menu = NSMenu()
        menu.addItem(withTitle: "Gnirehtet", action: nil, keyEquivalent: "")
        menu.addItem(NSMenuItem.separator())
        menu.addItem(withTitle: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        return menu
    }()
    
    init() {
        // Hook up the statusItem's menu
        statusItem.menu = menu
    }
    
}
