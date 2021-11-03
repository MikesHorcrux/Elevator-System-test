//
//  FloorController.swift
//  Elevator System
//
//  Created by Mike  Van Amburg on 11/3/21.
//

import Foundation
import ElevatorKit

class FloorController {
    var elevatorController = ElevatorController()

    var floor = Floor()
    
    func elevatorIsRequested(requestedFloor: Int) {
        if isButtonPressed(atFloor: requestedFloor) {
            floor.button.isActivated = true
            elevatorController.elevatorQue.append(requestedFloor)
            elevatorController.updateElevator()
        }
    }
    
    func floorIsRequested(requestedFloor: Int) {
        if isButtonInsideElevatorPressed(ofFloor: requestedFloor) {
            floor.button.isActivated = true
            elevatorController.elevatorQue.append(requestedFloor)
            elevatorController.updateElevator()
        }
    }
    
}
