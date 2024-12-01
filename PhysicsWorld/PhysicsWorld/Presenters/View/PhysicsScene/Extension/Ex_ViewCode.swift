//
//  PhysicsSceneEx.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//
import SwiftUI
import UIKit

extension PhysicsScene: ViewCode {
    func addConstraints() {
        NSLayoutConstraint.activate([
            qtdNodesLabel.centerYAnchor.constraint(equalTo: view.bottomAnchor),
            qtdNodesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resetButton.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10)
        ])
    }
    
    func addViews() {
        view.addSubview(qtdNodesLabel)
        view.addSubview(resetButton)
    }
    
    func setupStyle() {
        qtdNodesLabel.textAlignment = .center
        qtdNodesLabel.frame = view.bounds
        qtdNodesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.systemBackground, for: .normal)
        resetButton.backgroundColor = .label
        resetButton.layer.cornerRadius = 10
        resetButton.layer.zPosition = 1
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

#Preview {
    ContentView()
}
