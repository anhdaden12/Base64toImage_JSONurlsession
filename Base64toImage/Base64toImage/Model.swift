//
//  Model.swift
//  Base64toImage
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

struct Weather: Codable {
    var location: Location
    struct Location: Codable {
        var localtime: String
    }
    var current: Current
    
    struct Current: Codable {
        var condition: Condition
        
        
        struct Condition: Codable {
            var icon: String
        }
    }
}
