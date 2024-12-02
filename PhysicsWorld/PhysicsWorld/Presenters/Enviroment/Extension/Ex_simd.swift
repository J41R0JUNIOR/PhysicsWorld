//
//  Ex_simd.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 02/12/24.
//

import simd
import Foundation


extension simd_float2 {
    func transformToCGPoint() -> CGPoint {
        return CGPoint(x: Double(self.x), y: Double(self.y))
    }
}

