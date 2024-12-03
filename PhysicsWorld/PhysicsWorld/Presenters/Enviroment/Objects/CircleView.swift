//
//  CustomCircle.swift
//  Budget
//
//  Created by Jairo Júnior on 16/01/24.
//

import SwiftUI
import simd

class CircleView: ObjConformation {
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
        context.addEllipse(in: rect)
        userInterfaceStyle == .dark ? context.setFillColor(UIColor.white.cgColor) : context.setFillColor(UIColor.black.cgColor)
        context.fillPath()
    }
}

#Preview {
    ContentView()
}
