//
//  PhysicsSceneEx.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import UIKit

extension PhysicsScene: ViewCode {
    func addConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
    
    func addViews() {
        view.addSubview(label)
    }
    
    func setupStyle() {
        label.text = text
        label.textAlignment = .center
        label.frame = view.bounds
        label.translatesAutoresizingMaskIntoConstraints = false
    }
}
