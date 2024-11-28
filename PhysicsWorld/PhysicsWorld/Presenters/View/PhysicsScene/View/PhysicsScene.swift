//
//  PhysicsScene.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import UIKit
import SwiftUI

class PhysicsScene: UIViewController {
    var gameTimer: Timer?
    let text: String
    let label = UILabel()
    var objects: [UIView & ObjectsProtocol] = []

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
    
    func update(_ currentTime: TimeInterval){
        calculatePhysics()
    }
    
    func addcircle() {
        let circleView = CircleView(radius: 15, position: .init(x: 200, y: 300), mass: 10)
        self.view.addSubview(circleView)
        self.objects.append(circleView)
    }
    
    func calculatePhysics() {
        for i in objects.indices {
            let object = objects[i]
            
            print(object.isDynamic)
            guard object.isDynamic else { continue }
            
            let response = applyintGravity(for: object)
            objects[i].velocity = response.velocity
            objects[i].center = response.newPosition
        }
    }

    func applyintGravity(for object: UIView & ObjectsProtocol) -> (velocity: CGPoint, newPosition: CGPoint) {
        let gravity = CGPoint(x: 0, y: 9.81)
        let deltaTime = deltaTime
        
        let newVelocity = CGPoint(
            x: object.velocity.x + gravity.x * object.mass * CGFloat(deltaTime),
            y: object.velocity.y + gravity.y * object.mass * CGFloat(deltaTime)
        )
        
        let newPosition = CGPoint(
            x: object.center.x + newVelocity.x * CGFloat(deltaTime),
            y: object.center.y + newVelocity.y * CGFloat(deltaTime)
        )
        
        if object.layer.position.y > self.view.bounds.maxY + object.layer.frame.height {
            let initialPosition = CGPoint(x: object.layer.position.x, y: .zero - object.layer.frame.height)
            
            return (velocity: .zero, newPosition: initialPosition)
        }
        
        return (velocity: newVelocity, newPosition: newPosition)
        
        
        
      
    }
}

#Preview {
    PhysicsScene()
}
