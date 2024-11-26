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
    // Cria a instância de UIViewController
    func makeUIViewController(context: Context) -> T {
        return controller
    }

    // Atualiza a UIViewController com novos dados
    func updateUIViewController(_ uiViewController: T, context: Context) {
        // Aqui você pode atualizar o conteúdo do PhysicsScene se necessário
    }
}


//struct RepresentedViewController: UIViewControllerRepresentable {
//    // Cria a instância de UIViewController
//    func makeUIViewController(context: Context) -> PhysicsScene {
//        return PhysicsScene()
//    }
//
//    // Atualiza a UIViewController com novos dados
//    func updateUIViewController(_ uiViewController: PhysicsScene, context: Context) {
//        // Aqui você pode atualizar o conteúdo do PhysicsScene se necessário
//    }
//}
