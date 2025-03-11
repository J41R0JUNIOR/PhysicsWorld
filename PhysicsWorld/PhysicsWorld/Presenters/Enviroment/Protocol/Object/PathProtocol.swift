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
        
        let steps = 50
        let timeStep: TimeInterval = 0.1 
        var simulatedPosition = object.position
        var simulatedDirection = object.direction

        object.path.move(to: simulatedPosition.transformToCGPoint())

        for _ in 1...steps {
            let acceleration = object.forceApplyedByEnviroment / object.mass
            simulatedDirection += acceleration * Float(timeStep)
            simulatedPosition += simulatedDirection * Float(timeStep)
            
            object.path.addLine(to: simulatedPosition.transformToCGPoint())
        }

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = object.path.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.fillColor = nil
        shapeLayer.name = "\(object.id)"

        DispatchQueue.main.async {
            self.superview?.layer.sublayers?
                .filter { $0.name == "\(object.id)" }
                .forEach { $0.removeFromSuperlayer() }
            
            self.superview?.layer.addSublayer(shapeLayer)
        }
    }
}



#Preview {
    ContentView()
}

