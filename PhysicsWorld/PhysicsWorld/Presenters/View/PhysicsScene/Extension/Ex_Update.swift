//
//  Ex_Update.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 27/11/24.
//

import UIKit

extension PhysicsScene {
    var deltaTime: TimeInterval { 1/60}
    
    func startUpdateLoop() {
        gameTimer = Timer.scheduledTimer(withTimeInterval: deltaTime, repeats: true) { [weak self] time in
            self?.update(time.timeInterval)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          gameTimer?.invalidate()
      }
}

