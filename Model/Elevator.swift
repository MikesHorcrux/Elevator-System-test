//
//  Elevator.swift
//  Elevator System
//
//  Created by Mike  Van Amburg on 11/3/21.
//

import Foundation

struct Elevator {
    var buttons: [Buttons] = [
                            Button(id: 1, label: "1", isActivated: false, type: .floor),
                            Button(id: 2, label: "2", isActivated: false, type: .floor),
                            Button(id: 3, label: "3", isActivated: false, type: .floor),
                            Button(id: 4, label: "4", isActivated: false, type: .floor),
                            Button(id: 5, label: "5", isActivated: false, type: .floor),
                            Button(id: 101, label: "Close", isActivated: false, type: .closeDoor),
                            Button(id: 102, label: "Emergency", isActivated: false, type: .emergency)
                              ]
    var doors = Doors (areOpen: false)
    var currentFloor = 1
    var status: elevatorStatus = .idel
    
    var display {
        currentFloor
    }
}


enum elevatorStatus {
    case moving
    case stopped
    case loading
    case idel
}
