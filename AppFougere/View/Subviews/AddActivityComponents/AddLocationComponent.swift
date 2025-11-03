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
    
    @State private var cameraPosition: MapCameraPosition = .automatic
    
    @State var userLocation: CLLocationCoordinate2D?

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
                    if locationManager.location != nil {
                        let coordinates = CLLocationCoordinate2D(
                            latitude: locationManager.location!.coordinate.latitude,
                            longitude: locationManager.location!.coordinate.longitude
                        )
                        let span = MKCoordinateSpan(
                            latitudeDelta: 0.02,
                            longitudeDelta: 0.02
                        )
                        let region = MKCoordinateRegion(
                            center: coordinates,
                            span: span
                        )
                        
                        cameraPosition =
                            .region(region)
                                
                            
                    }
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
            Map(position: $cameraPosition){
//                Marker(coordinate: pinLocation) {
//                    Label("Chez moi", systemImage: "house")
//                }
//                .tint(.yellow)
                Annotation(
                    "Montpellier",
                    coordinate: CLLocationCoordinate2D(
                        latitude: 43.608071,
                        longitude: 3.883121
                    ), content: {
                        Image(systemName: "star")
                            .font(.title)
                            .padding()
                            .background(.white)
                            .clipShape(Circle())
                    }
                )
            }
            .onAppear {
                let initialPosition = CLLocationCoordinate2D(latitude: 43.61091, longitude: 3.87630)
                let initialSpan = MKCoordinateSpan(
                    latitudeDelta: 0.02,
                    longitudeDelta: 0.02)
                let initialRegion = MKCoordinateRegion(
                    center: initialPosition,
                    span: initialSpan
                )
                cameraPosition = .region(initialRegion)
                
            }
            .mapControls{
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
                MapPitchToggle()
            }
                
            
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
