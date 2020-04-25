//
//  MenuBarExtra.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-24.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import Cocoa

class MenuBarExtra {
    static let ICON_DEVICE_CONNECTED = "baseline_mobile_friendly_black_18pt"
    static let ICON_DEVICE_DISCONNECTED = "baseline_mobile_off_black_18pt"
    
    let statusItem: NSStatusItem = {
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        item.button?.image = NSImage(named: MenuBarExtra.ICON_DEVICE_DISCONNECTED)
        return item
    }()
    
    let menu: NSMenu = {
        let menu = NSMenu()
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        menu.addItem(withTitle: "Gnirehtet v\(version)", action: nil, keyEquivalent: "")
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem.separator())
        menu.addItem(withTitle: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        return menu
    }()
    
    var deviceItems = [NSMenuItem]()
    
    func refresh(with devices: [Device]) {
        // Remove all of the device items
        for item in deviceItems {
            menu.removeItem(item)
        }
        
        // Insert NSMenuItems for each connected device
        deviceItems = devices.enumerated().map { menu.insertItem(withTitle: $1.description, action: nil, keyEquivalent: "", at: 2 + $0) }
        statusItem.menu = menu
        
        // Update the statusItem's icon
        if devices.isEmpty {
            statusItem.button?.image = NSImage(named: MenuBarExtra.ICON_DEVICE_DISCONNECTED)
        } else {
            statusItem.button?.image = NSImage(named: MenuBarExtra.ICON_DEVICE_CONNECTED)
        }
    }
}
