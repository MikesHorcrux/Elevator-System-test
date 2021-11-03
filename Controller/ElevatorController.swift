//
//  VideoController.swift
//  Elevator System
//
//  Created by Mike  Van Amburg on 11/3/21.
//

import Foundation
import ElevatorKit

class ElevatorController {
    var floor = FloorController()
    var elevatorQue: [Int] = []
    var requestedFloor = elevatorQue.popLast()
    var elevator = Elevator()

    init{
        elevator.currentFloor = whatFloorIsElevatorAtNow()
    }
    func updateElevator() {
        switch elevator.status {
        case .moving:
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
                if requestedFloor != whatFloorIsElevatorAtNow() {
                    print("Elevator is moving to floor", requestedFloor)
                    elevator.doors.areOpen = false
                    subscribeToDoorClose(isOpen: false)
                } else {
                    elevator.status = .stopped
                    }
            }
        case .loading:
            elevator.doors.areOpen = true
            subscribeToDoorClose(isOpen: true)
            
            Timer.scheduledTimer(withTimeInterval: 100.0, repeats: false) { timer in
                elevator.doors.areOpen = false
                
                elevator.status = .idel
            }
            
        case .stopped:
            elevator.currentFloor = whatFloorIsElevatorAtNow()
            elevator.status = .loading
            
        case .idel:
            if elevatorQue != nil {
                    
                guard requestedFloor else {
                    elevator.status = .idel
                }
                elevator.buttons.map { $0.floor == requestedFloor ? false : $0.isActivated }
                goTo(floor: requestedFloor)
                elevator.status = .moving
            } else {
                elevator.status = .idel
            }
        }
    }
    
    func subscribeToDoorClose(isOpen: Bool) {
        floor.floor.doors.areOpen
        .map { isOpen }
        .assign(to: \.floor, on: self)
        .store(in: &cancellables)
    }
}
