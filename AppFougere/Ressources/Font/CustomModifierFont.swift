//
//  File.swift
//  AppFougere
//
//  Created by JulietteM on 30/10/2025.
//

import Foundation
import SwiftUI

// étend les capacités de toute les View
extension View {
    
    func customText(bold: Bool, fontSize: Double, color: Color) -> some View {
        self
            .font(.custom(bold ? "Inter-Regular_Bold" : "Inter-Regular", size: fontSize))
            .foregroundStyle(color)
    }
    
    func customTitle(color: Color) -> some View {
        self
            .font(.custom("Inter-Regular_Bold", size: 32))
            .foregroundStyle(color)
    }
    
    func customSubtitle(bold: Bool, color: Color) -> some View {
        self
            .font(.custom(bold ? "Inter-Regular_Bold" : "Inter-Regular", size: 28))
            .foregroundStyle(color)
    }
    
    func customBody(bold: Bool, color: Color) -> some View {
        self
            .font(.custom(bold ? "Inter-Regular_Bold" : "Inter-Regular", size: 20))
            .foregroundStyle(color)
    }
}
