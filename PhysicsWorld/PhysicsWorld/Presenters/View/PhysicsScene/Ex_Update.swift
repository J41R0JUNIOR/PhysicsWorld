//
//  Ex_Update.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 27/11/24.
//

import UIKit

extension PhysicsScene {
    var timerInterval: TimeInterval { 1/60 }
    
    func startUpdateLoop() {
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { [weak self] time in
            self?.update(time.timeInterval)
        }
    }
}
