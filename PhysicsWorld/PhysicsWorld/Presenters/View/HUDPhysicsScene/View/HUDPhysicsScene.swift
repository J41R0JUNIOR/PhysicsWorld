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
    
    var massSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 1000
        slider.value = 10
        slider.tintColor = .systemBlue

        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        massSlider.addTarget(self, action: #selector(massSliderChanged), for: .valueChanged)
        
        setupViewCode()
        startUpdateLoop(deltaTime: deltaTime)
    }
    
    @objc func massSliderChanged(_ sender: UISlider) {
        let newMass = sender.value
        printContent(newMass)
       
        updateMass()
    }
    
    func updateMass() {
        
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
        
        self.editModeToggle.text = physicsScene.isEditingMode ? "Disable Edit" : "Edit"
        
        self.pathCreationToggle.text = !physicsScene.isCreatingPaht ? "Disable Path" : "Show Path"
    }
}

#Preview {
    ContentView()
}
