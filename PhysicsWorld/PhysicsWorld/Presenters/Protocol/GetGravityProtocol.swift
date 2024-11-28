//
//  GetGravityProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 28/11/24.
//

import Foundation
import UIKit

protocol GetGravityProtocol {
    func applyintGravity(for object: UIView & ObjectsProtocol, deltaTime: TimeInterval) -> (velocity: CGPoint, newPosition: CGPoint)
    func update(deltatime: TimeInterval)
}

extension GetGravityProtocol {
    func applyintGravity(for object: UIView & ObjectsProtocol, deltaTime: TimeInterval) -> (velocity: CGPoint, newPosition: CGPoint) {
        let gravity = CGPoint(x: 0, y: 9.81)
        
        let newVelocity = CGPoint(
            x: object.velocity.x + gravity.x * object.mass * CGFloat(deltaTime),
            y: object.velocity.y + gravity.y * object.mass * CGFloat(deltaTime)
        )
        
        let newPosition = CGPoint(
            x: object.center.x + newVelocity.x * CGFloat(deltaTime),
            y: object.center.y + newVelocity.y * CGFloat(deltaTime)
        )
        
//        if object.layer.position.y > frame.bounds.maxY + object.layer.frame.height {
//            let initialPosition = CGPoint(x: object.layer.position.x, y: -object.layer.frame.height)
//            return (velocity: .zero, newPosition: initialPosition)
//        }
        
        if object.layer.position.y > 850 + object.layer.frame.height {
            let initialPosition = CGPoint(x: object.layer.position.x, y: -object.layer.frame.height)
            return (velocity: .zero, newPosition: initialPosition)
        }
        
        return (velocity: newVelocity, newPosition: newPosition)
    }
}
