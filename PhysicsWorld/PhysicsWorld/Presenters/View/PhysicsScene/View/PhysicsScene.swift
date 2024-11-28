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
    
    func update(_ currentTime: TimeInterval){
        for n in objects {
            n.update(deltatime: currentTime)
            
        }
    }
    
    func addcircle() {
        let circleView = CircleView(radius: 15, position: .init(x: 200, y: 300), mass: 10)
        self.view.addSubview(circleView)
        self.objects.append(circleView)
    }
}

#Preview {
    PhysicsScene()
}
