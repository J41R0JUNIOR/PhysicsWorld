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
         
                touchedObject.attraction = .init(x: Double.random(in: -10...10), y: Double.random(in: -10...10))
                
                return
            }
            
            
            self.addObject(type: CircleView.self, position: position, radius: Double.random(in: 5...40), mass: Double.random(in: 5...30))
        }
    }
    
    func update(_ currentTime: TimeInterval){
        for n in objects {
            n.update(deltatime: currentTime)
            
        }
    }
    
    func addObject<T: UIView & GetGravityProtocol & ObjectsProtocol>(type: T.Type ,position: CGPoint, radius: CGFloat, mass: CGFloat, isDynamic: Bool = true) {
        
        let obj = T(radius: radius, position: position, velocity: .zero, mass: mass, isDynamic: isDynamic)
        
        self.view.addSubview(obj)
        self.objects.append(obj)
    }
}

#Preview {
    PhysicsScene()
}
