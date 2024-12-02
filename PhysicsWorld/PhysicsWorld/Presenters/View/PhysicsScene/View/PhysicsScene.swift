//
//  PhysicsScene.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import UIKit
import SwiftUI
import simd

class PhysicsScene: UIViewController, ViewProtocol {
    var gameTimer: Timer?
    var qtdNodes: Int
    let qtdNodesLabel = UILabel()
    let resetButton = UIButton()
    var objects: [ObjConformation] = []
    
    init() {
        self.qtdNodes = 0
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
        startUpdateLoop()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
    
    @objc func reset(){
        for n in objects{
            n.removeFromSuperview()
            objects.removeAll(where: { $0 === n })
        }
    }
    
    func update(_ currentTime: TimeInterval){
        updateObjects(currentTime)
        
        self.qtdNodes = self.view.subviews.count
        qtdNodesLabel.text = "qtd nodes: \(qtdNodes)"
        
    }
}

#Preview {
    ContentView()
}
