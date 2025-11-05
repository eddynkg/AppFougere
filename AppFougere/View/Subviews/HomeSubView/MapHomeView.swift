//
//  MapHomeView.swift
//  AppFougere
//
//  Created by JulietteM on 30/10/2025.
//

import MapKit
import SwiftUI

/*
 To-do:
 - Ouvrir DetailActivityView depuis un pin
 */

struct MapHomeView: View {

    // MARK: - Données carte
    /// Dictionnaire : nom d’activité → position géographique (MKMapItem)
    @State var activitiesMarkerInfos: [String: MKMapItem] = [:]

    // MARK: - Filtres
    @Binding var disability: Bool
    @Binding var difficulty: Double
    @Binding var distance: Double

    // MARK: - Filtrage des activités
    /// Filtre les activités selon la difficulté, l’accessibilité et la distance.
    var filteredActivities: [Activity] {
        var result = activities

        if difficulty >= 1 {
            result = result.filter { $0.difficulty <= difficulty }
        }

        if disability {
            result = result.filter { $0.handicap == true }
        }

        //        if distance > 0 {
        //            result = result.filter { $0.distance <= distance }
        //        }

        return result
    }

    // MARK: - Interface
    var body: some View {
        // Carte générée à partir du dictionnaire (nom → coordonnées)
        Map {
            ForEach(Array(activitiesMarkerInfos), id: \.key) { key, value in
                Marker(key, coordinate: value.placemark.coordinate)
                    .tint(.capVerde)
            }
        }
        .clipShape(
            UnevenRoundedRectangle(
                cornerRadii: .init(topLeading: 40, topTrailing: 40)
            )
        )
        // Met à jour les marqueurs dès que le filtrage évolue
        .onChange(of: filteredActivities) {
            Task {
                var addressMapItems: [MKMapItem] = []
                let activitiesAddresses: [String] = filteredActivities.map {
                    $0.location
                }

                // Géocodage de chaque adresse
                for address in activitiesAddresses {
                    if let request = MKGeocodingRequest(addressString: address)
                    {
                        do {
                            let mapItems = try await request.mapItems
                            if let first = mapItems.first {
                                addressMapItems.append(first)
                            }
                        } catch {
                            print("Error: \(error)")
                        }
                    }
                }

                // Vérifie la correspondance du nombre d’éléments
                guard filteredActivities.count == activitiesAddresses.count
                else {
                    print("Mismatch between activities and coordinates count")
                    return
                }

                // Remplit le dictionnaire avec les coordonnées correspondantes
                for (index, activity) in filteredActivities.enumerated() {
                    activitiesMarkerInfos[activity.name] =
                        addressMapItems[index]
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MapHomeView(
        disability: .constant(false),
        difficulty: .constant(0),
        distance: .constant(50)
    )
}
