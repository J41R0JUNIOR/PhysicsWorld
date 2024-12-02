//
//  PhysicsScene.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import UIKit
import SwiftUI
import simd

class PhysicsScene: UIViewController, ViewProtocol, Updateable {
    var deltaTime: TimeInterval = 1/60
    var timerToUpdate: Timer?
    
    var objects: [ObjConformation] = []
    var isEditingMode: Bool = false
    var isCreatingPaht: Bool = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        startUpdateLoop(deltaTime: deltaTime)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isEditingMode else { return }
        
        if let touch = touches.first {
            let position = touch.location(in: view)
            let mass = Float.random(in: 10_000...50_000)
            let radius = mass / 5000
            
            self.addObject(type: CircleView.self, position: .init(x: Float(position.x), y: Float(position.y)), radius: radius, mass: mass, in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.controlCamera(deltaTime, touches: touches)
    }
    
  
    
    func update(_ currentTime: TimeInterval){
        updateObjects(currentTime, isCreatingPaht: isCreatingPaht)
    }
}

#Preview {
    ContentView()
}
