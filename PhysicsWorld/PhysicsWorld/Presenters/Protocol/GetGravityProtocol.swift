//
//  GetGravityProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 28/11/24.
//

import Foundation
import UIKit
import simd

protocol GetGravityProtocol {
    
    func applyintGravity(for object: UIView & ObjectsProtocol, deltaTime: TimeInterval) -> (direction: simd_float2, newPosition: simd_float2)
    
    func update(deltatime: TimeInterval)
}

extension GetGravityProtocol {

    func applyintGravity(for object: UIView & ObjectsProtocol, deltaTime: TimeInterval) -> (direction: simd_float2, newPosition: simd_float2) {
        
//        let vector = simd_float2(x: 10, y: 10)
//        let vector2 = simd_float2(x: 10, y: 10)
        
//        let sum = vector * vector2
        let deltaTimeGravity = object.mass * Float(deltaTime)
        
        let newDirection = simd_float2(
            x: object.direction.x + object.forceApplyedByEnviroment.x ,
            y: object.direction.y + object.forceApplyedByEnviroment.y
        )
        
        let newPosition = simd_float2(
            x: Float(object.center.x + CGFloat(newDirection.x * Float(deltaTime))),
            y: Float(object.center.y + CGFloat(newDirection.y * Float(deltaTime)))
        )
        
        return (direction: newDirection, newPosition: newPosition)
    }
    
//    func findOtherGravityForce(for objects: [UIView & ObjectsProtocol], in object: UIView & ObjectsProtocol){
//        let greatG = 6.674 * pow(10, -11) * pow(object.mass, 2)
//        let r = sqrt((greatG * object.mass)/(greatG * object.mass * pow(object.radius, 2)))
//        print(r)
//        for n in objects {
//            if n !== object {
//                let distance = n.position
//                
//            }
//        }
//        
//    }
    
    func findOtherGravityForce(for objects: [UIView & ObjectsProtocol], in object: UIView & ObjectsProtocol, deltaTime: TimeInterval) {
        let greatG = 6.674 * powf(10, -11)  // Constante gravitacional
        
        // Iterar sobre todos os objetos
        for var otherObject in objects {
            // Verifica se o objeto não é o mesmo
            if otherObject !== object {
                let dx =  object.position.x - otherObject.position.x
                let dy =  object.position.y - otherObject.position.y
                let distance = sqrt(dx * dx + dy * dy)
              
                
                // Calcular a força gravitacional entre os dois objetos
                let force = greatG * (object.mass * otherObject.mass) / pow(distance, 2)
                
             
                let r = sqrt((greatG * object.mass)/(greatG * object.mass * pow(object.radius, 2))) * 1000
               
                
                let thresholdDistance: Float = r  // Distância limite em metros
                if distance < thresholdDistance {

                    otherObject.position.x += dx / distance * force
                    otherObject.position.y += dy / distance * force
        
                }
                
            }
        }
    }
}

//extension CGPoint {
//    init(vec3: simd_float3) {
//        self.x = vec3.x
//        self.y = vec3.y
//    }
//}

#Preview {
    PhysicsScene()
}
