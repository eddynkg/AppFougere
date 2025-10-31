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

        Map()
            .clipShape(  UnevenRoundedRectangle(cornerRadii: .init(topLeading: 40, topTrailing: 40)))
    }
}

#Preview {
    MapHomeView()
}
