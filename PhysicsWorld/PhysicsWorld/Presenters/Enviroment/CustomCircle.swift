//
//  CustomCircle.swift
//  Budget
//
//  Created by Jairo Júnior on 16/01/24.
//

import SwiftUI
import simd

class CircleView: UIView, ObjectsProtocol, GetGravityProtocol {
    var acceleration: simd_float2
    
    var forceApplyedByEnviroment: simd_float2
    var position: simd_float2
    var direction: simd_float2
    var mass: Float
    var isDynamic: Bool
    var radius: Float
    
    required init(radius: Float, position: simd_float2 = .zero, direction: simd_float2 = .zero, mass: Float = .zero, isDynamic: Bool = true, forceApplyedByEnviroment: simd_float2 = .zero) {
        self.radius = radius
        self.isDynamic = isDynamic
        self.direction = direction
        self.mass = mass
        self.forceApplyedByEnviroment = forceApplyedByEnviroment
        self.position = position
        self.acceleration = forceApplyedByEnviroment / mass
        
        super.init(frame: CGRect(x: CGFloat(radius), y:  CGFloat(radius), width: CGFloat(radius) * 2, height: CGFloat(radius) * 2))
        
        self.center.y = CGFloat(position.y)
        self.center.x = CGFloat(position.x)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.addEllipse(in: rect)
        context.setFillColor(UIColor.blue.cgColor)
        context.fillPath()
    }
    
    func update(deltatime: TimeInterval){
        let result = applyGravity(for: self, deltaTime: deltatime)
        self.position = result.newPosition
        self.direction = result.direction
        self.center.y = CGFloat(position.y)
        self.center.x = CGFloat(position.x)
        
       
    }
}

#Preview {
    PhysicsScene()
}
