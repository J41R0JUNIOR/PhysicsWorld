//
//  ObjectsProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import Foundation
import SwiftUICore

protocol ObjectsProtocol {
    var position: CGPoint { get set }
    var velocity: CGPoint { get set }
    var mass: Double { get set }
    var isDynamic: Bool { get set }
}
