//
//  PathProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 02/12/24.
//

import Foundation
import QuartzCore
import UIKit
import SwiftUI


protocol PathProtocol: UIView {
}

extension PathProtocol {
    func createPath(for object: ObjConformation) {
        object.path.removeAllPoints()
        
        let steps = 10
        let timeStep: TimeInterval = 0.1
        var simulatedPosition = object.position
        var simulatedDirection = object.direction
        
        object.path.move(to: CGPoint(x: CGFloat(simulatedPosition.x), y: CGFloat(simulatedPosition.y)))
        
        for _ in 1...steps {
            let deltaTimeGravity = object.mass * Float(timeStep)
            simulatedDirection += object.forceApplyedByEnviroment * Float(timeStep)
            simulatedPosition += simulatedDirection * Float(deltaTimeGravity)
            
            object.path.addLine(to: simulatedPosition.transformToCGPoint())
        }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = object.path.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.fillColor = nil
        shapeLayer.name = "\(object.id)"
        
        if let node = self.superview?.layer.sublayers?.first(where: { $0.name == "\(object.id)" }){
            node.removeFromSuperlayer()
        }
        self.superview?.layer.addSublayer(shapeLayer)
    }
}


#Preview {
    ContentView()
}

