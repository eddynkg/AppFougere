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
        HStack {
            Text("Localisation : ")
                .frame(maxWidth: .infinity, alignment: .leading)
                .customBody(bold: true, color: .capVerde)
            
                
            
                
            
        }
        VStack {
                    if let loc = locationManager.location {
                        Text("Lat: \(loc.coordinate.latitude), Lon: \(loc.coordinate.longitude)")
                    }
                    LocationButton {
                        locationManager.requestLocation()
                    }
                    .labelStyle(.iconOnly)
                    .frame(height: 44)
                    .tint(.green)
                }
        
        
    }
    
    
}

#Preview {
    AddLocationComponent()
}
