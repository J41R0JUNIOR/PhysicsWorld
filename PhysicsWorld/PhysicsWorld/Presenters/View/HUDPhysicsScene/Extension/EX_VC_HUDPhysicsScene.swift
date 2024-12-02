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
            editModeToggle.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resetButton.topAnchor.constraint(equalTo: editModeToggle.bottomAnchor, constant: 10),
            
            pathCreationToggle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pathCreationToggle.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 10)
        ])
    }
    
    func addViews() {
        view.addSubview(qtdNodesLabel)
        view.addSubview(resetButton)
        view.addSubview(editModeToggle)
        view.addSubview(physicsScene.view)
        view.addSubview(pathCreationToggle)
        
        view.bringSubviewToFront(pathCreationToggle)
        view.bringSubviewToFront(resetButton)
        view.bringSubviewToFront(editModeToggle)
    }
    
    func setupStyle() {
        qtdNodesLabel.textAlignment = .center
        qtdNodesLabel.frame = view.bounds
        qtdNodesLabel.translatesAutoresizingMaskIntoConstraints = false
        qtdNodesLabel.backgroundColor = .systemBackground
        
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
        
        editModeToggle.setTitle("Edit", for: .normal)
        editModeToggle.setTitleColor(.systemBackground, for: .normal)
        editModeToggle.backgroundColor = .label
        editModeToggle.layer.cornerRadius = 10
        editModeToggle.layer.zPosition = 1
        editModeToggle.addTarget(self, action: #selector(editMode), for: .touchUpInside)
        editModeToggle.translatesAutoresizingMaskIntoConstraints = false
        
        pathCreationToggle.setTitle("Path", for: .normal)
        pathCreationToggle.setTitleColor(.systemBackground, for: .normal)
        pathCreationToggle.backgroundColor = .label
        pathCreationToggle.layer.cornerRadius = 10
        pathCreationToggle.layer.zPosition = 1
        pathCreationToggle.addTarget(self, action: #selector(createPath), for: .touchUpInside)
        pathCreationToggle.translatesAutoresizingMaskIntoConstraints = false
    }
}

#Preview {
    ContentView()
}
