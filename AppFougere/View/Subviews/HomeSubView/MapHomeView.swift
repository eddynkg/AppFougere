//
//  MapHomeView.swift
//  AppFougere
//
//  Created by JulietteM on 30/10/2025.
//

import SwiftUI
import MapKit

/*  To do list:
        - add API to locate with adresses not coo
        - show pins base on location
        - filterable pins
        - acces DetailActivityView from pin
 */

struct MapHomeView: View {
    var body: some View {

        // Creation of the map
        Map()
            .clipShape(  UnevenRoundedRectangle(cornerRadii: .init(topLeading: 40, topTrailing: 40)))
            .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MapHomeView()
}
