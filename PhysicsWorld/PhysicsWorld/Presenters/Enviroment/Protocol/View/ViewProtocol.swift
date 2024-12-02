//
//  ObjectViewProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 30/11/24.
//

import UIKit
import simd

protocol ViewProtocol: UIViewController {
    var objects: [ObjConformation] { get set }
}

extension ViewProtocol {
    func addObject<T: ObjConformation>(type: T.Type ,position: simd_float2, radius: Float, mass: Float, isDynamic: Bool = true, in view: UIViewController & ViewProtocol) {
        
        let obj = T(radius: radius, position: position, mass: mass, isDynamic: isDynamic)
        obj.layer.zPosition = -1
        view.view.addSubview(obj)
        view.objects.append(obj)
    }
    
    func updateObjects(_ deltaTime: TimeInterval, isCreatingPaht: Bool){
        for var n: ObjConformation in objects {
            
//            if isObjectInView(n) {
//                
//                n.removeFromSuperview()
//                objects.removeAll(where: { $0 === n })
//                
//                return
//            }
            
            n.update(deltatime: deltaTime)
            n.applyEnviromentGravity(for: &objects, in: &n, deltaTime: deltaTime)
            
            if isCreatingPaht {
                n.createPath(for: n)
            }
        }
    }
    
  
    
//    func isObjectInView(_ object: ObjConformation) -> Bool {
//        return CGFloat(object.position.x) > view.bounds.maxX + view.layer.position.x || CGFloat(object.position.x) < view.bounds.minX - view.layer.position.x || CGFloat(object.position.y) > view.bounds.maxY || CGFloat(object.position.y) < view.bounds.minY ? true : false
//    }
    
    func controlCamera(_ deltaTime: TimeInterval, touches: Set<UITouch>){
        guard let touch = touches.first else { return }
        let position = touch.location(in: view)
        let previusLocation = touch.previousLocation(in: view)
        
        let dx = Float(position.x - previusLocation.x)
        let dy = Float(position.y - previusLocation.y)
        
        var direction = simd_float2(x: dx , y: dy )
        direction *= 0.5
        
        let newDirection = direction.transformToCGPoint()
        
        view.layer.position.x += newDirection.x
        view.layer.position.y += newDirection.y
    }
}
