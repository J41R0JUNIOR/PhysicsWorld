//
//  ViewCode.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import UIKit

// Extension that allows adding multiple views to the hierarchy in a single call. Example: addViews(label1, label2, button1, button2)
extension UIView {
    func addListSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

protocol ViewCode {
    // Adds views as subviews and defines the hierarchy between them
    func addViews()
    
    // Defines the constraints to be used for positioning the elements in the view
    func addConstraints()
    
    // Defines the styles for the view, such as color, borders, etc.
    func setupStyle()
}


// Chama todos os métodos do protocolo
extension ViewCode {
    func setupViewCode() {
        addViews()
        addConstraints()
        setupStyle()
    }
}
