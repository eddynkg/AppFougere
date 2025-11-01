//
//  AddLocationComponent.swift
//  AppFougere
//
//  Created by Basile Carle on 30/10/2025.
//

import SwiftUI
import CoreLocation
import CoreLocationUI
import MapKit
import Observation

struct AddLocationComponent: View {
    @State var locationManager = LocationManager()
    @State var searchCompleter = SearchCompleter()
    @State var locationSearch: String = ""
    @State var areSuggestionDisplayed: Bool = false
    @State var isMapDisplayed: Bool = false
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 43.61091, longitude: 3.87630),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    var pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(
        latitude: 43.61091,
        longitude: 3.87630
    )

    var body: some View {
        VStack {
            HStack {
                Text("Localisation : ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .customBody(bold: true, color: .capVerde)
                if locationManager.location != nil {
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
            TextField("Adresse de l'activité", text: $locationSearch)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(
                    of: locationSearch
                ) {
                    areSuggestionDisplayed = true
                    searchCompleter.updateResults(for: locationSearch)
                }
            if areSuggestionDisplayed {
                VStack {
                    ForEach(searchCompleter.results, id: \.self) { result in
                        Text(result)
                            .onTapGesture {
                                locationSearch = result
                                areSuggestionDisplayed = false
                            }
                    }
                }
            }
            Map{
                Marker("Montpellier", coordinate: pinLocation)
            }.mapControlVisibility(.visible)
                .frame(height: 300)
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )
                .padding()
        }
        
    }
}

#Preview {
    AddLocationComponent()
}
