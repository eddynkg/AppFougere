//
//  FilterComponent.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import SwiftUI

struct FilterComponent: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundStyle(.chefHat)
            
            Image(systemName: "line.3.horizontal.decrease")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.capVerde)
            
        }
    }
}

#Preview {
    FilterComponent()
}
