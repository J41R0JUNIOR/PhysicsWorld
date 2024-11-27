//
//  PhysicsScene.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import UIKit
import SwiftUI

class PhysicsScene: UIViewController {
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
    }
    
    func addcircle(){
        let circleView = CircleView(radius: 100, position: .init(x: 200, y: 300))
        self.view.addSubview(circleView)
    }
    
}



#Preview {
    PhysicsScene(text: "Nada")
}
