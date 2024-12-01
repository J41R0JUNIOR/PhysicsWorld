//
//  PhysicsScene.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import UIKit
import SwiftUI
import simd

class PhysicsScene: UIViewController, ObjectViewProtocol {
    var gameTimer: Timer?
    var qtdNodes: Int
    let qtdNodesLabel = UILabel()
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
        view.backgroundColor = .clear
        setupViewCode()
        startUpdateLoop()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            
            if var touchedObject = objects.first(where: { $0.frame.contains(position) }) {
                
                touchedObject.forceApplyedByEnviroment = .init(x: 0, y:0)
                touchedObject.direction = .init(x: 0, y:0)
                
                return
            }
            
            let mass = Float.random(in: 1_000...50_000)
            let radius = mass / 5000
            self.addObject(type: CircleView.self, position: .init(x: Float(position.x), y: Float(position.y)), radius: radius, mass: mass, in: self)

        }
    }
    
    func update(_ currentTime: TimeInterval){
        for var n: ObjConformation in objects {
            
            if CGFloat(n.position.x) > view.bounds.maxX + view.layer.position.x || CGFloat(n.position.x) < view.bounds.minX - view.layer.position.x || CGFloat(n.position.y) > view.bounds.maxY || CGFloat(n.position.y) < view.bounds.minY {
                
                n.removeFromSuperview()
                objects.removeAll(where: { $0 === n })
                
            }else{
                n.update(deltatime: currentTime)
                n.findOtherGravityForce(for: &objects, in: &n, deltaTime: deltaTime)
            }
        }
        
        self.qtdNodes = self.view.subviews.count
        qtdNodesLabel.text = "qtd nodes: \(qtdNodes)"
    }
    

}

#Preview {
    PhysicsScene()
}
