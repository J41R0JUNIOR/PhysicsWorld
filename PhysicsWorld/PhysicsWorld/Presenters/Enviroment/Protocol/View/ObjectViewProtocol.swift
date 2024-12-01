//
//  ObjectViewProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 30/11/24.
//

import UIKit
import simd

protocol ObjectViewProtocol: UIViewController {
    var objects: [ObjConformation] { get set }
}

extension ObjectViewProtocol {
    func addObject<T: ObjConformation>(type: T.Type ,position: simd_float2, radius: Float, mass: Float, isDynamic: Bool = true, in view: UIViewController & ObjectViewProtocol) {
        
        let obj = T(radius: radius, position: position, direction: .init(x: 0, y: 0), mass: mass, isDynamic: isDynamic, forceApplyedByEnviroment: .init(x: 0, y:0))
        
        view.view.addSubview(obj)
        view.objects.append(obj)
    }
}
