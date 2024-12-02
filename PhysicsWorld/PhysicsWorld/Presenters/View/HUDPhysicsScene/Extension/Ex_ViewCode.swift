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
            
            resetButton.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func addViews() {
        view.addSubview(qtdNodesLabel)
        view.addSubview(resetButton)
        
//        addChild(physicsScene)
        view.addSubview(physicsScene.view)
    }
    
    func setupStyle() {
        qtdNodesLabel.textAlignment = .center
        qtdNodesLabel.frame = view.bounds
        qtdNodesLabel.translatesAutoresizingMaskIntoConstraints = false
        qtdNodesLabel.backgroundColor = .white
        
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.systemBackground, for: .normal)
        resetButton.backgroundColor = .label
        resetButton.layer.cornerRadius = 10
        resetButton.layer.zPosition = 1
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        physicsScene.view.layer.zPosition = -1
        physicsScene.view.frame = view.bounds
        physicsScene.view.backgroundColor = .clear
        physicsScene.didMove(toParent: self)
        
        physicsScene.view.layer.borderWidth = 10
        physicsScene.view.layer.borderColor = UIColor.blue.cgColor
        physicsScene.view.layer.bounds.size = .init(width: 4000, height: 4000)
        
        
    }
}

#Preview {
    ContentView()
}
