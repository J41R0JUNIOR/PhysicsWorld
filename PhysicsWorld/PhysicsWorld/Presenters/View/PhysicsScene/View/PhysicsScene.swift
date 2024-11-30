//
//  PhysicsScene.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import UIKit
import SwiftUI
import simd

class PhysicsScene: UIViewController {
    var gameTimer: Timer?
    let text: String
    let label = UILabel()
    var objects: [UIView & ObjectsProtocol & GetGravityProtocol] = []
    
    init(text: String = "") {
        self.text = text
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupViewCode()
        startUpdateLoop()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            
            if var touchedObject = objects.first(where: { $0.frame.contains(position) }) {
                
                touchedObject.forceApplyedByEnviroment = .init(x: 0, y:01)
                
                touchedObject.direction = .init(x: 0, y:0)
                
                return
            }
            
            let mass = Float.random(in: 1_000...50_000)
            let radius = mass / 5000
            self.addObject(type: CircleView.self, position: .init(x: Float(position.x), y: Float(position.y)), radius: radius, mass: mass)

        }
    }
    
    func update(_ currentTime: TimeInterval){
        for var n: any UIView & ObjectsProtocol & GetGravityProtocol in objects {
            n.update(deltatime: currentTime)
            n.findOtherGravityForce(for: objects, in: &n, deltaTime: deltaTime)
        }
    }
    
    func addObject<T: UIView & GetGravityProtocol & ObjectsProtocol>(type: T.Type ,position: simd_float2, radius: Float, mass: Float, isDynamic: Bool = true) {
        
        let obj = T(radius: radius, position: position, direction: .init(x: 0, y: 0), mass: mass, isDynamic: isDynamic, forceApplyedByEnviroment: .init(x: 0, y:0))
        
        self.view.addSubview(obj)
        self.objects.append(obj)
    }
}

#Preview {
    PhysicsScene()
}
