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
    private var gnirehtet: Gnirehtet?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        gnirehtet = Gnirehtet()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        gnirehtet = nil
    }
}
