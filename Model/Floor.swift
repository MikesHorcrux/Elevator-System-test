//
//  floor.swift
//  Elevator System
//
//  Created by Mike  Van Amburg on 11/3/21.
//

import Foundation

struct Floor {
    var id: Int
    var name: String
    var button: Button {
        Button(floor: id, label: name, isActivated: false, type: .call)
    }
    var doors: Doors
}
// init
