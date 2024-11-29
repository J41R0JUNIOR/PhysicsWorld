//
//  GetGravityProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 28/11/24.
//

import Foundation
import UIKit

protocol GetGravityProtocol {
    var attraction: CGPoint { get set }
    
    func applyintGravity(for object: UIView & ObjectsProtocol, deltaTime: TimeInterval) -> (velocity: CGPoint, newPosition: CGPoint)
    func update(deltatime: TimeInterval)
}

extension GetGravityProtocol {
//    var gravity: CGPoint {  get {  CGPoint(x: 0, y: 9.81) } set {  gravity = newValue } }
    
    func applyintGravity(for object: UIView & ObjectsProtocol, deltaTime: TimeInterval) -> (velocity: CGPoint, newPosition: CGPoint) {
       
        let newVelocity = CGPoint(
            x: object.velocity.x + attraction.x * object.mass * CGFloat(deltaTime),
            y: object.velocity.y + attraction.y * object.mass * CGFloat(deltaTime)
        )
        
        let newPosition = CGPoint(
            x: object.center.x + newVelocity.x * CGFloat(deltaTime),
            y: object.center.y + newVelocity.y * CGFloat(deltaTime)
        )
        
        return (velocity: newVelocity, newPosition: newPosition)
    }
}

#Preview {
    PhysicsScene()
}
