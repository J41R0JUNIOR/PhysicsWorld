//
//  ObjectsProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import Foundation
import SwiftUICore

protocol ObjectsProtocol: Shape {
    var position: CGVector { get set }
    var velocity: CGVector { get set }
    var mass: Double { get set }
    var isStatic: Bool { get set }
}
