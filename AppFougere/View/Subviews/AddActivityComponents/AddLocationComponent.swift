//
//  AddLocationComponent.swift
//  AppFougere
//
//  Created by Basile Carle on 30/10/2025.
//

import SwiftUI
import CoreLocation
import CoreLocationUI
import Observation

struct AddLocationComponent: View {
    @State var locationManager = LocationManager()
    
  
    var body: some View {
        VStack {
            HStack {
                Text("Localisation : ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .customBody(bold: true, color: .capVerde)
                if let loc = locationManager.location {
                    Text("Position enregistrée")
                        .customText(bold: false, fontSize: 10, color: .capVerde)
                        .frame(width: 110, alignment: .center )
                }
                LocationButton {
                    locationManager.requestLocation()
                }
                .labelStyle(.iconOnly)
                .frame(height: 32)
                .foregroundStyle(.white)
                .tint(.capVerde)
                
            }
        }
        
    }
}

#Preview {
    AddLocationComponent()
}
