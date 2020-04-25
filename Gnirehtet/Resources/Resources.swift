//
//  Resources.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-24.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

import Foundation

enum Executable: String {
    case adb = "adb"
    case gnirehtet = "gnirehtet"
    
    var url: URL? {
        return Bundle.main.url(forResource: self.rawValue, withExtension: "")
    }
}

struct Resources {
    static let basePath = Bundle.main.resourcePath!
}
