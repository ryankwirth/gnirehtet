//
//  Device.swift
//  Gnirehtet
//
//  Created by Ryan Wirth on 2020-04-24.
//  Copyright © 2020 Ryan Wirth. All rights reserved.
//

struct Device: CustomStringConvertible, Hashable {
    var serial: String
    var product: String
    
    var description: String {
        return "\(product) (\(serial))"
    }
    
    init?(_ output: String) {
        // Break the device line up by whitespace
        let components = output.components(separatedBy: " ")
        
        // The serial is always first, followed by `product:XXXXX` somewhere
        if let serial = components.first, let product = components.first(where: { $0.starts(with: "product:") }) {
            self.serial = serial
            self.product = product.replacingOccurrences(of: "product:", with: "")
        } else {
            return nil
        }
    }
}
