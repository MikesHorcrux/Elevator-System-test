//
//  button.swift
//  Elevator System
//
//  Created by Mike  Van Amburg on 11/3/21.
//

import Foundation

struct Button {
    var floor: Int = 0
    var label: String
    var isActivated: Bool
    var type: buttonType = .floor
}


enum buttonType {
    case floor
    case closeDoor
    case emergency
    case call
}

