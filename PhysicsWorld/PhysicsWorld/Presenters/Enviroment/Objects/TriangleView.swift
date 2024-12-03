//  CustomCircle.swift
//  Budget
//
//  Created by Jairo Júnior on 16/01/24.

import SwiftUI
import simd

struct TriangleView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .init(x: rect.midX, y: rect.minY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct RectangleView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .init(x: rect.minX, y: rect.minY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    ContentView()
}
