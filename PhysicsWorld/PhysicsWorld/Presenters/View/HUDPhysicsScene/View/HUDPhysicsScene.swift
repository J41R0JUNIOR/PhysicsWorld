//
//  HUDPhysicsScene.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 02/12/24.
//

import Foundation
import UIKit
import SwiftUI

class HUDPhysicsScene: UIViewController {

    let physicsScene = PhysicsScene()
    
    var qtdNodes: Int = 0
    let qtdNodesLabel: UILabel = .init()
    let resetButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
       
    }
    
    @objc func reset() {
        for n in physicsScene.objects {

            n.removeFromSuperview()
            physicsScene.objects.removeAll(where: { $0 === n })
        }
    }
    
    func update() {
        self.qtdNodes = self.view.subviews.count
        qtdNodesLabel.text = "qtd nodes: \(qtdNodes)"
    }
}

#Preview {
    ContentView()
}
