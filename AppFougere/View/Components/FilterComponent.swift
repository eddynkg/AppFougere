//
//  FilterComponent.swift
//  AppFougere
//
//  Created by JulietteM on 27/10/2025.
//

import SwiftUI

/* To do list :
    - when clicked show the filters
        - slider for distance
        - choose difficulty
        - disable friendly checkbox
    - filter the activities
 */

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
