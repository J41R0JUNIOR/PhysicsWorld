//
//  GetGravityProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 28/11/24.
//

import Foundation
import UIKit
import simd

protocol GravityProtocol {
//    func update(deltatime: TimeInterval)
}

extension GravityProtocol {
    
    func applyGravity(for object: UIView & ObjectsProtocol, deltaTime: TimeInterval) -> (direction: simd_float2, newPosition: simd_float2) {
  
        let deltaTimeGravity = object.mass * Float(deltaTime)
        
        let newDirection = simd_float2(
            x: object.direction.x + object.forceApplyedByEnviroment.x * Float(deltaTime),
            y: object.direction.y + object.forceApplyedByEnviroment.y * Float(deltaTime)
        )
        
        let newPosition = simd_float2(
            x: Float(object.center.x + CGFloat(newDirection.x * deltaTimeGravity)),
            y: Float(object.center.y + CGFloat(newDirection.y * deltaTimeGravity))
        )
        
        return (direction: newDirection, newPosition: newPosition)
    }
    
    
    func findOtherGravityForce(for objects: inout [ObjConformation], in object:  inout ObjConformation, deltaTime: TimeInterval) {
        let G: Float = 6.674e-11
        
        object.forceApplyedByEnviroment = simd_float2.zero
        
        for otherObject in objects {
            guard otherObject !== object else { continue }
            
            let dx = Float(otherObject.center.x - object.center.x)
            let dy = Float(otherObject.center.y - object.center.y)
            let distance = sqrt(dx * dx + dy * dy)
            
            guard distance > 0 else { continue }
            
            let force = G * (object.mass * otherObject.mass) / (distance * distance)
            
            let direction = simd_float2(x: dx / distance, y: dy / distance)
            
            object.forceApplyedByEnviroment += direction * force
           
            
            let qtdSubpieces = object.mass + otherObject.mass / Float.random(in: 1...10)
            
//            if distance <= otherObject.radius || distance <= object.radius {
//                object.removeFromSuperview()
//                otherObject.removeFromSuperview()
//                objects.removeAll(where: { $0 === otherObject})
//                objects.removeAll(where: { $0 === object})
//            }
        }
        
    }
}

#Preview {
    PhysicsScene()
}
