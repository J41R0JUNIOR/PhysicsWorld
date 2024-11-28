//
//  ContentView.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        UIKitToSwiftUI(controller: PhysicsScene(text: "Bolinha de gorlfe"))
    
    }
}

#Preview {
    ContentView()
}
