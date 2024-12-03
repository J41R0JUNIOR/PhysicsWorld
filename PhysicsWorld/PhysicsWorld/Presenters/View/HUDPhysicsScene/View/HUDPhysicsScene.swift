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
    
    var resetButton = CustomButton(text: "Reset", target: HUDPhysicsScene.self, action: #selector (reset), event: .touchUpInside)
    
    var editModeToggle = CustomButton(text: "Edit", target: HUDPhysicsScene.self, action: #selector (editMode), event: .touchDown)
    
    var pathCreationToggle = CustomButton(text: "Show Path", target: HUDPhysicsScene.self, action: #selector (createPath), event: .touchDown)
    
    var moveUpButton = CustomButton(text: "Up", target: HUDPhysicsScene.self, action: #selector (up), event: .touchDown)
    
    var moveDownButton =  CustomButton(text: "Down", target: HUDPhysicsScene.self, action: #selector (down), event: .touchDown)
    
    var moveLeftButton: UIButton = .init()
    
    var moveRightButton: UIButton = .init()
    
    var followShipButton = CustomButton(text: "Disable Follow", target: HUDPhysicsScene.self, action: #selector (followShipToggle), event: .touchDown)

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
    
    @objc func up() {
        physicsScene.spaceShip.forceApplyedByEnviroment = .init(0, -0.01)
    }
    
    @objc func down() {
        physicsScene.spaceShip.forceApplyedByEnviroment = .init(0, 0.01)
    }
    
    @objc func resetUpAndDown(){
        physicsScene.spaceShip.forceApplyedByEnviroment = .zero
    }
    
    @objc func followShipToggle(){
        physicsScene.followShip.toggle()
    }
    
    func update(_ deltaTime: TimeInterval) {
        
        self.qtdNodes = physicsScene.view.subviews.count
        qtdNodesLabel.text = "qtd nodes: \(qtdNodes)"
        

        self.editModeToggle.text = physicsScene.isEditingMode ? "Disable Edit" : "Edit"
        
        self.pathCreationToggle.text = !physicsScene.isCreatingPaht ? "Disable Path" : "Show Path"
        
        self.followShipButton.text = !physicsScene.followShip ? "Disable Follow" : "Follow Ship"
        
      
    }
}

#Preview {
    ContentView()
}
