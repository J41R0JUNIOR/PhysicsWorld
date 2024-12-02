//
//  HUDPhysicsScene.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 02/12/24.
//

import Foundation
import UIKit
import SwiftUI

class HUDPhysicsScene: UIViewController, Updateable {
    var timerToUpdate: Timer?
    
    var deltaTime: TimeInterval = 1/60
    
    let physicsScene = PhysicsScene()
    
    var qtdNodes: Int = 0
    let qtdNodesLabel: UILabel = .init()
    let resetButton = UIButton()
    var editModeToggle: UIButton = .init()
    var pathCreationToggle: UIButton = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
        startUpdateLoop(deltaTime: deltaTime)
    }
    
    @objc func reset() {
        for n in physicsScene.objects {
            
            n.removeFromSuperview()
            physicsScene.objects.removeAll(where: { $0 === n })
            physicsScene.view.layer.sublayers?.removeAll(where: { $0 is CAShapeLayer })
        }
    }
    
    @objc func editMode() {
        physicsScene.isEditingMode.toggle()
    }
    
    @objc func createPath() {
        physicsScene.isCreatingPaht.toggle()
        physicsScene.view.layer.sublayers?.removeAll(where: { $0 is CAShapeLayer })
    }
    
    func update(_ deltaTime: TimeInterval) {
        
        self.qtdNodes = physicsScene.view.subviews.count
        qtdNodesLabel.text = "qtd nodes: \(qtdNodes)"
        
        self.editModeToggle.setTitle(physicsScene.isEditingMode ? "Disable Edit" : "Edit Mode", for: .normal)
        
        self.pathCreationToggle.setTitle(physicsScene.isCreatingPaht ? "Disable Path" : "Show Path", for: .normal)
    }
}

#Preview {
    ContentView()
}
