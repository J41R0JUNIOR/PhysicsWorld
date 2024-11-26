//
//  ViewCode.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import UIKit

// Extensão que permite adicionar mais de uma view à hierarquia em uma única chamada. Exemplo: addViews(label1, label2, button1, button2)
extension UIView {
    func addListSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

protocol ViewCode {
    // Adiciona views como subviews e define a hierarquia entre elas
    func addViews()
    
    // Define as constraints a serem usadas para posicionar os elementos na view
    func addContrains()
    
    // Define os estilos da view, como cor, bordas, etc.
    func setupStyle()
}

// Chama todos os métodos do protocolo
extension ViewCode {
    func setupViewCode() {
        addViews()
        addContrains()
        setupStyle()
    }
}
