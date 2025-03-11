//
//  SpaceShipView.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 03/12/24.
//

import SwiftUI
import simd



class SpaceShipView: ObjConformation {
    let upPath = TriangleView()
    let bodyPath = RectangleView()
    let downPath = TriangleView()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    required init(radius: Float, position: simd_float2, direction: simd_float2, mass: Float, isDynamic: Bool, forceApplyedByEnviroment: simd_float2) {
        
        super.init(radius: radius, position: position, direction: direction, mass: mass, isDynamic: isDynamic, forceApplyedByEnviroment: forceApplyedByEnviroment)
        
        self.center = position.transformToCGPoint()
        self.backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle

        guard let context = UIGraphicsGetCurrentContext() else { return }

        let upRect = CGRect(origin: .init(x: rect.midX - rect.width * 0.1, y: rect.minY ),
                            size: .init(width: rect.width * 0.2, height: rect.height * 0.3))
        context.addPath(upPath.path(in: upRect).cgPath)
        
        
        let bodyRect = CGRect(origin: .init(x: rect.midX - rect.width * 0.1, y: upRect.maxY ),
                              size: .init(width: rect.width * 0.2, height: rect.height * 0.43))
        context.addPath(bodyPath.path(in: bodyRect).cgPath)
        
        
        let downRect = CGRect(origin: .init(x: rect.midX - rect.width * 0.15, y: bodyRect.maxY ),
                              size: .init(width: rect.width * 0.3, height: rect.width * 0.2))
        context.addPath(downPath.path(in: downRect).cgPath)
        
        
        let fillColor = userInterfaceStyle == .dark ? UIColor.white.cgColor : UIColor.black.cgColor
        context.setFillColor(fillColor)
        context.fillPath()
    }
}

#Preview {
    SpaceShipView(radius: 23, position: .zero, direction: .zero, mass: 10, isDynamic: true, forceApplyedByEnviroment: .zero)
}
