//
//  ObjectClassToConformToProtocols.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 30/11/24.
//

import Foundation
import simd
import UIKit
import SwiftUI

class ObjConformation: UIView, ObjectsProtocol, GravityProtocol, PathProtocol {
    let id: UUID = .init()
    var position: simd_float2
    var direction: simd_float2
    var forceApplyedByEnviroment: simd_float2
    var mass: Float
    var radius: Float
    var isDynamic: Bool
    
    var path: UIBezierPath = .init()
   
    
    required init(radius: Float, position: simd_float2, direction: simd_float2 = .init(), mass: Float, isDynamic: Bool, forceApplyedByEnviroment: simd_float2 = .init()) {
        self.forceApplyedByEnviroment = forceApplyedByEnviroment
        self.direction = direction
        self.isDynamic = isDynamic
        self.mass = mass
        self.position = position
        self.radius = radius
        super.init(frame: CGRect(x: CGFloat(radius), y:  CGFloat(radius), width: CGFloat(radius) * 2, height: CGFloat(radius) * 2))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(deltatime: TimeInterval){
        let result = applyGravity(for: self, deltaTime: deltatime)
        self.position = result.newPosition
        self.direction = result.direction
        self.center = position.transformToCGPoint()
        
       
//        createPath(for: self)
        
    }
}

#Preview {
    ContentView()
}
