//
//  CustomCircle.swift
//  Budget
//
//  Created by Jairo Júnior on 16/01/24.
//

import SwiftUI

//struct CustomCircle: ObjectsProtocol, Shape {
//    var position: CGVector
//    var velocity: CGVector
//    var mass: Double
//    var radius: Double
//    var isStatic: Bool
//    
//
//    init(position: CGVector = .zero, velocity: CGVector = .zero, mass: Double = .zero, radius: Double, isStatic: Bool = true) {
//        self.position = position
//        self.velocity = velocity
//        self.mass = mass
//        self.radius = radius
//        self.isStatic = isStatic
//    }
//    
//    // Método path para desenhar o círculo
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let center = CGPoint(x: rect.midX, y: rect.midY)
//        path.addArc(center: center, radius: CGFloat(radius), startAngle: .zero, endAngle: .degrees(360), clockwise: false)  
//        return path
//    }
//}
//
//#Preview {
//    CustomCircle(radius: 170)
//}

class CircleView: UIView, ObjectsProtocol {
    var position: CGPoint
    var velocity: CGPoint
    var mass: Double
    var isDynamic: Bool
    var radius: CGFloat
    
    init(radius: CGFloat, position: CGPoint = .zero, velocity: CGPoint = .zero, mass: Double = .zero, isDynamic: Bool = true) {
        self.radius = radius
        self.position = position
        self.isDynamic = isDynamic
        self.velocity = velocity
        self.mass = mass
        
        super.init(frame: CGRect(x: position.x - radius, y: position.y - radius, width: radius * 2, height: radius * 2))
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
}
