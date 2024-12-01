//
//  CustomCircle.swift
//  Budget
//
//  Created by Jairo Júnior on 16/01/24.
//

import SwiftUI
import simd

class CircleView: ObjConformation {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(radius: Float, position: simd_float2, direction: simd_float2, mass: Float, isDynamic: Bool, forceApplyedByEnviroment: simd_float2) {
        super.init(radius: radius, position: position, direction: direction, mass: mass, isDynamic: isDynamic, forceApplyedByEnviroment: forceApplyedByEnviroment)
        
        self.center.y = CGFloat(position.y)
        self.center.x = CGFloat(position.x)
        self.backgroundColor = .clear
    }
    
    
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.addEllipse(in: rect)
        context.setFillColor(UIColor.blue.cgColor)
        context.fillPath()
    }
    
//    override func update(deltatime: TimeInterval){
//        let result = applyGravity(for: self, deltaTime: deltatime)
//        self.position = result.newPosition
//        self.direction = result.direction
//        self.center.y = CGFloat(position.y)
//        self.center.x = CGFloat(position.x)
//    }
}

#Preview {
    PhysicsScene()
}
