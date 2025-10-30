//
//  MapHomeView.swift
//  AppFougere
//
//  Created by JulietteM on 30/10/2025.
//

import SwiftUI
import MapKit

struct MapHomeView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Map()
                .clipShape(  UnevenRoundedRectangle(cornerRadii: .init(topLeading: 40, topTrailing: 40)))
                .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    MapHomeView()
}
