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

        // Creation of the map base on dictionary
        VStack {
            Map {
                ForEach(Array(activitiesMarkerInfos), id: \.key) { key, value in

                    // Marker showing the activity name at the related cordinates
                    Marker(
                        key,
                        coordinate: value.placemark.coordinate
                    )
                    .tint(.capVerde)
                }
            }
            .clipShape(
                UnevenRoundedRectangle(
                    cornerRadii: .init(topLeading: 40, topTrailing: 40)
                )
            )
            .onChange(of: filteredActivities) {
                Task {
                    // temporary array of the coordinates
                    var adressMapItems = [MKMapItem]()

                    // temporary array of only the activities' adresses
                    var activitiesAdresses: [String] = []
                    for activity in filteredActivities {
                        activitiesAdresses.append(activity.location)
                    }

                    // for each activities' adresses
                    for adress in activitiesAdresses {

                        // request the adress' coordinates
                        if let request = MKGeocodingRequest(
                            addressString: adress
                        ) {

                            do {
                                let mapitems = try await request.mapItems

                                // adding the coordinates to our temporary array
                                if let mapitem = mapitems.first {
                                    adressMapItems.append(mapitem)
                                }

                            } catch let error {
                                print("Error : \(error)")
                            }
                        } catch {
                            print("Error: \(error)")
                        }
                    }

                    // verification there's the same number of entries in activities and adresses' coordinates
                    guard filteredActivities.count == activitiesAdresses.count
                    else {
                        print(
                            "There's not the same number of activities as the activities' coordinates"
                        )
                        return
                    }

                    // filling the dictionnary with key: activities' name and value: activities' coordinates
                    for (index, activity) in filteredActivities.enumerated() {
                        activitiesMarkerInfos[activity.name] = adressMapItems[index]
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea()
            
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    MapHomeView(
        disability: .constant(false),
        difficulty: .constant(0),
        distance: .constant(50)
    )
}
