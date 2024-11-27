//
//  PhysicsScene.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import UIKit
import SwiftUI

class PhysicsScene: UIViewController {
    var timer: Timer?
    
    var text: String
    let label = UILabel()
    var objects: [any ObjectsProtocol] = []
    
    init(text: String) {
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
        addcircle()
        startUpdateLoop()
    }
    
   
    
    func addcircle(){
        let circleView = CircleView(radius: 100, position: .init(x: 200, y: 300))
        self.view.addSubview(circleView)
    }
    
    func calculatePhysics(){
        for n in self.view.subviews{
            n.layer.position = calculateFall(node: n)
        }
    }
    
    func calculateFall(node: UIView) -> CGPoint{
        return .init(x: 0, y: 0)
    }
    
    func update(_ currentTime: TimeInterval){
        calculatePhysics()
    }
    
}



#Preview {
    PhysicsScene(text: "Nada")
}
