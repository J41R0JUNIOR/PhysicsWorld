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
    var isEditingMode: Bool = true
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
        
     
//
//        self.view.anchorPoint = .init((x: self.view.layer.position.x, y: self.view.layer.position.y))
        
//        self.view.anchorPoint = self.view.layer.position
       
        
        
//        self.addObject(type: SpaceShipView.self, position: .init(x: Float(1984), y: Float(1937)), radius: 50, mass: 50000, in: self)
        
//        let posX: CGFloat = 1984
//        let posY: CGFloat = 1937
        
//        self.view.anchorPoint = .init(x: posX, y: posY)
        
//        self.addObject(type: SpaceShipView.self, position: .init(x: Float(posX), y: Float(posY)), radius: 50, mass: 50000, in: self)
        
//        self.view.layer.position = .init(x: posX, y: posY)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isEditingMode else { return }
        
        if let touch = touches.first {
            let position = touch.location(in: view)
            let mass = Float.random(in: 50_000...100_000)
            let radius = mass / 10000
           
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
