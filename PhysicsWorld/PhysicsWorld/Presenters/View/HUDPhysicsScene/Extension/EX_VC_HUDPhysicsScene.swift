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
            
            followShipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            followShipButton.topAnchor.constraint(equalTo: view.topAnchor),
            
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resetButton.topAnchor.constraint(equalTo: editModeToggle.bottomAnchor, constant: 10),
            
            pathCreationToggle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pathCreationToggle.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 10),
            
            moveUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            moveDownButton.trailingAnchor.constraint(equalTo: moveUpButton.trailingAnchor),
            
            moveDownButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            moveUpButton.bottomAnchor.constraint(equalTo: moveDownButton.topAnchor, constant: -10),
        ])
    }
    
    func addViews() {
        view.addSubview(physicsScene.view)
        view.addSubview(followShipButton)
        view.addSubview(qtdNodesLabel)
        view.addSubview(resetButton)
        view.addSubview(editModeToggle)
        view.addSubview(pathCreationToggle)
        view.addSubview(moveUpButton)
        view.addSubview(moveDownButton)
        view.addSubview(moveLeftButton)
        view.addSubview(moveRightButton)
    }
    
    func setupStyle() {
        qtdNodesLabel.textAlignment = .center
        qtdNodesLabel.frame = view.bounds
        qtdNodesLabel.backgroundColor = .systemBackground
        
        qtdNodesLabel.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        followShipButton.translatesAutoresizingMaskIntoConstraints = false
        editModeToggle.translatesAutoresizingMaskIntoConstraints = false
        pathCreationToggle.translatesAutoresizingMaskIntoConstraints = false
        moveUpButton.translatesAutoresizingMaskIntoConstraints = false
        moveDownButton.translatesAutoresizingMaskIntoConstraints = false
        
        moveUpButton.addTarget(self, action: #selector(resetUpAndDown), for: .touchUpInside)
        moveDownButton.addTarget(self, action: #selector(resetUpAndDown), for: .touchUpInside)
        
        
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
