//
//  PhysicsSceneEx.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//
import SwiftUI
import UIKit

extension HUDPhysicsScene: ViewCode {
    func addConstraints() {
        NSLayoutConstraint.activate([
            qtdNodesLabel.centerYAnchor.constraint(equalTo: view.bottomAnchor),
            qtdNodesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            editModeToggle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            editModeToggle.topAnchor.constraint(equalTo: view.topAnchor),
            
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resetButton.topAnchor.constraint(equalTo: editModeToggle.bottomAnchor, constant: 10),
            
            pathCreationToggle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pathCreationToggle.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 10),
            
            massSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(massSlider.frame.width)),
            massSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(massSlider.frame.height)),
            
        ])
    }
    
    func addViews() {
        view.addSubview(physicsScene.view)
        view.addSubview(qtdNodesLabel)
        view.addSubview(resetButton)
        view.addSubview(editModeToggle)
        view.addSubview(massSlider)
        view.addSubview(pathCreationToggle)
       

    }
    
    func setupStyle() {
        qtdNodesLabel.textAlignment = .center
        qtdNodesLabel.frame = view.bounds
        qtdNodesLabel.backgroundColor = .systemBackground
        
        qtdNodesLabel.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        editModeToggle.translatesAutoresizingMaskIntoConstraints = false
        pathCreationToggle.translatesAutoresizingMaskIntoConstraints = false
//        massSlider.translatesAutoresizingMaskIntoConstraints = false
      
        physicsScene.view.layer.zPosition = -1
        physicsScene.view.frame = view.bounds
        physicsScene.view.backgroundColor = .clear
        physicsScene.didMove(toParent: self)
        physicsScene.view.layer.borderWidth = 10
        physicsScene.view.layer.borderColor = UIColor.blue.cgColor
        physicsScene.view.layer.bounds.size = .init(width: 4000, height: 4000)

    }
}

class CustomButton: UIButton {
    var text: String
    var targeT: Any?
    var actioN: Selector
    
    init(text: String, target: Any?, action: Selector, event: UIControl.Event){
        self.text = text
        self.actioN = action
        
        
        super.init(frame: .infinite)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
        setTitle(text, for: .normal)
        layer.backgroundColor = UIColor.black.cgColor
        addTarget(targeT, action: actioN, for: .touchUpInside)
        setTitleColor(.systemBackground, for: .normal)
        backgroundColor = .label
        layer.cornerRadius = 10
        layer.zPosition = 1
    }
}


//#Preview{
//
//    Button(text: "Hello, World!", target: .none, action:.init(""))
//}

#Preview {
    ContentView()
}
