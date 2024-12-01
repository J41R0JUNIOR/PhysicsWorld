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
        
        let obj = T(radius: radius, position: position, direction: .init(x: 0, y: 0), mass: mass, isDynamic: isDynamic, forceApplyedByEnviroment: .init(x: 0, y:0))
        obj.layer.zPosition = 0
        view.view.addSubview(obj)
        view.objects.append(obj)
    }
    
    func updateObjects(_ deltaTime: TimeInterval){
        for var n: ObjConformation in objects {
            
            if isObjectInView(n) {
                
                n.removeFromSuperview()
                objects.removeAll(where: { $0 === n })
                
                return
            }
            
            n.update(deltatime: deltaTime)
            n.applyEnviromentGravity(for: &objects, in: &n, deltaTime: deltaTime)
            
        }
    }
    
    func isObjectInView(_ object: ObjConformation) -> Bool {
        return CGFloat(object.position.x) > view.bounds.maxX + view.layer.position.x || CGFloat(object.position.x) < view.bounds.minX - view.layer.position.x || CGFloat(object.position.y) > view.bounds.maxY || CGFloat(object.position.y) < view.bounds.minY ? true : false
    }
}
