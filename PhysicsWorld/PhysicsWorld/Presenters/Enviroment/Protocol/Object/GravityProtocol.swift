//
//  GetGravityProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 28/11/24.
//

import Foundation
import UIKit
import simd
import SwiftUI

protocol GravityProtocol {
}

extension GravityProtocol {
    
    func applyGravity(for object: ObjConformation, deltaTime: TimeInterval) -> (direction: simd_float2, newPosition: simd_float2) {
  
        let deltaTimeGravity = object.mass * Float(deltaTime)
        
        let newDirection = object.direction + object.forceApplyedByEnviroment * Float(deltaTime)
        
        let newPosition = object.position + newDirection * Float(deltaTimeGravity)
        
        return (direction: newDirection, newPosition: newPosition)
    }
    
    func applyEnviromentGravity(for objects: inout [ObjConformation], in object:  inout ObjConformation, deltaTime: TimeInterval) {
        let G: Float = 6.674e-11
        
        object.forceApplyedByEnviroment = simd_float2.zero
        
        for otherObject in objects {
            guard otherObject !== object else { continue }
            
            let dx = Float(otherObject.center.x - object.center.x)
            let dy = Float(otherObject.center.y - object.center.y)
            var distance = sqrt(dx * dx + dy * dy)
            
            if distance <= otherObject.radius || distance <= object.radius {
                distance = object.radius + otherObject.radius
            }
            
            guard distance > 0 else { continue }
            
            let force = G * (object.mass * otherObject.mass) / (distance * distance)
            
            let direction = simd_float2(x: dx / distance, y: dy / distance)
            
            object.forceApplyedByEnviroment += direction * force
        }
        
    }
}

#Preview {
    ContentView()
}
