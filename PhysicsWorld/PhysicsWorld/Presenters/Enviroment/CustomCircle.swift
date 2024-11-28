//
//  CustomCircle.swift
//  Budget
//
//  Created by Jairo Júnior on 16/01/24.
//

import SwiftUI

class CircleView: UIView, ObjectsProtocol, GetGravityProtocol {
 
    var position: CGPoint {
        get { self.center }
        set { self.center = newValue }
    }
    var velocity: CGPoint
    var mass: Double
    var isDynamic: Bool
    var radius: CGFloat
    
    init(radius: CGFloat, position: CGPoint = .zero, velocity: CGPoint = .zero, mass: Double = .zero, isDynamic: Bool = true) {
        self.radius = radius
        
        self.isDynamic = isDynamic
        self.velocity = velocity
        self.mass = mass
        
        super.init(frame: CGRect(x: position.x - radius, y: position.y - radius, width: radius * 2, height: radius * 2))
        
        self.position = position
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
        let result = applyintGravity(for: self, deltaTime: deltatime)
        self.position = result.newPosition
        self.velocity = result.velocity
      
    }
}
