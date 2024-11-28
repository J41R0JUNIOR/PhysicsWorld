//
//  Square.swift
//  Budget
//
//  Created by Jairo Júnior on 16/01/24.
//

import Foundation

import SwiftUI

struct CustomRectangle: ObjectsProtocol, Shape{
    var position: CGPoint
    var velocity: CGPoint
    var mass: Double
    var isDynamic: Bool
    
    init(position: CGPoint = .zero, velocity: CGPoint = .zero, mass: Double = .zero, radius: Double , isStatic: Bool = true) {
        self.position = position
        self.velocity = velocity
        self.mass = mass
        self.isDynamic = isStatic
    }
  
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .init(x: rect.minX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.minY))
        path.addLine(to: .init(x: rect.maxX, y: rect.minY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        
        return path
    }
}

#Preview {
    CustomRectangle(radius: 1)
}
