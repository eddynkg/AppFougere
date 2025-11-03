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
    @State var geocoderService = GeocoderService()
    
    @State var locationSearch: String = ""
    @State var areSuggestionDisplayed: Bool = false
    @State var isMapDisplayed: Bool = false
    @State var isAdressSelected: Bool = false
    
    @State private var newRegion: MKCoordinateRegion?
    
    @State private var cameraPosition: MapCameraPosition = .automatic
    
    @Binding var activityLocation: String
    @State var userLocation: CLLocationCoordinate2D?
    @State var userLocationName: String = ""
    
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
                Button(action: {
                    isMapDisplayed.toggle()
                }) {
                    Image(systemName: "map")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .padding(8)
                        .background(
                            Capsule()
                                .fill(Color.capVerde)
                        )
                    
                }
                LocationButton {
                    locationManager.requestLocation()
                
                }
            }
            .padding(8)
            .labelStyle(.iconOnly)
            .frame(height: 32)
            .foregroundStyle(.white)
            .tint(.capVerde)
            .onChange(of: locationManager.location) {
                
                if locationManager.location != nil {
                    let coordinates = CLLocationCoordinate2D(
                        latitude: locationManager.location!.coordinate.latitude,
                        longitude: locationManager.location!.coordinate.longitude
                    )
                    let span = MKCoordinateSpan(
                        latitudeDelta: 0.02,
                        longitudeDelta: 0.02
                    )
                    newRegion = MKCoordinateRegion(
                        center: coordinates,
                        span: span
                    )
                    userLocation = coordinates
                    userLocationName = "Ma position"
                    cameraPosition =
                        .region(newRegion!)
                }
            }

            
            
            
        }
        .padding(.vertical)
        HStack {
            TextField("Recherchez puis validez", text: $locationSearch)

            
                .onChange(
                    of: locationSearch
                ) {
                    areSuggestionDisplayed = true
                    searchCompleter.updateResults(for: locationSearch)
                }
            Button(
                action: {
                    areSuggestionDisplayed = false
                    isMapDisplayed = false
                    locationSearch = ""
                    searchCompleter.results = []
                    
                }
            ) {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.capVerde)
            }
        }
        .padding()
        .background(Color.chefHat)
        .cornerRadius(30)
        
        if areSuggestionDisplayed {
            VStack {
                
                ForEach(searchCompleter.results, id: \.self) { result in
                    Text("\(result.title) : \(result.subtitle)")
                        .onTapGesture {
                            locationSearch = "\(result.title) : \(result.subtitle)"
                            Task {
                                let searchRegion = await geocoderService.translateSearchStringInCoordinate(
                                    searchString: result.title + " " + result.subtitle
                                )
                                DispatchQueue.main.async {
                                    if let checkRegion = searchRegion {
                                        cameraPosition =
                                            .region(checkRegion)
//                                        searchCompleter.results = []
                                        
                                        userLocation = checkRegion.center
                                        userLocationName = "\(result.title) : \(result.subtitle)"
                                        activityLocation = userLocationName
                                        areSuggestionDisplayed = false
                                        isAdressSelected = true
                                        isMapDisplayed = true
                                    }
                                }
                            }
                            
                        }
                }
            }
        }
        if isAdressSelected {
            VStack {
                Text("Adresse sélectionnée : ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 8)
                    .padding(.leading, 8)
                    .customBody(bold: true, color: .capVerde)
                HStack(alignment: .center) {
                    Button(
                        action: {
                            activityLocation = ""
                            isAdressSelected = false
                            locationSearch = ""
                        }
                    ) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(.red.opacity(0.6))
                            )
                    }
                    Spacer()
                    Text("\(activityLocation)")
                        .frame(width: 250, alignment: .trailing)
                        .padding(.top, 8)
                }.padding(.horizontal, 16)
                
            }
            
        } else {
            Text("Aucune Adresse sélectionnée")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 8)
                .padding(.leading, 8)
                .customBody(bold: false, color: .capVerde)
        }
        
        if isMapDisplayed {
            
            Map(position: $cameraPosition){
                Marker(coordinate: userLocation ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)) {
                    Label(userLocationName, systemImage: "pin.fill")
                }
                .tint(.capVerde)

            }
            .onAppear {
                let initialPosition = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
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
                MapCompass()
                MapScaleView()
                MapPitchToggle()
            }
            
            
            .frame(height: 300)
            .clipShape(
                RoundedRectangle(cornerRadius: 30)
            )
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
                        Text("\(result.title), \(result.subtitle)")
                            .onTapGesture {
                                locationSearch = "\(result.title) : \(result.subtitle)"
                                Task {
                                    let searchRegion = await geocoderService.translateSearchStringInCoordinate(
                                        searchString: result.subtitle
                                    )
                                    DispatchQueue.main.async {
                                        if let checkRegion = searchRegion {
                                            cameraPosition =
                                                .region(checkRegion)
                                            areSuggestionDisplayed = false
                                        }
                                    }
                                }
                                
                            }
                    }
                }
            }
 
        }
    }
    
}

#Preview {
    AddLocationComponent(activityLocation: .constant("colorado provençal"))
}
