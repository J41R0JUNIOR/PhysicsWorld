//
//  a.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import SwiftUI

struct UIKitToSwiftUI <T: UIViewController>: UIViewControllerRepresentable {
    var controller: T
    
    init(controller : T){
        self.controller = controller
    }
    func makeUIViewController(context: Context) -> T {
        return controller
    }

    func updateUIViewController(_ uiViewController: T, context: Context) {
    }
}

