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
        item.button?.action = #selector(helloWorld(_:))
        return item
    }()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // TODO
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // TODO
    }
    
    @objc func helloWorld(_ sender: Any?) {
        print("Hello World!")
    }
    
}
