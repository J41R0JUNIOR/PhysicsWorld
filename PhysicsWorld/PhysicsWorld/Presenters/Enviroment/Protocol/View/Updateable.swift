//
//  Ex_Update.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 27/11/24.
//

import UIKit

protocol Updateable: UIViewController {
    var timerToUpdate: Timer? { get set }
    var deltaTime: TimeInterval { get set }
    
    func update(_ deltaTime: TimeInterval)
}

extension Updateable {
    func startUpdateLoop(deltaTime: TimeInterval) {
        timerToUpdate = Timer.scheduledTimer(withTimeInterval: deltaTime, repeats: true) { [ weak self ] time in
            self?.update(time.timeInterval)
        }
    }
    
    func stopUpdateLoop() {
        timerToUpdate?.invalidate()
    }
}
