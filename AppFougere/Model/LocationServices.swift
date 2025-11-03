//
//  Location.swift
//  AppFougere
//
//  Created by Basile Carle on 31/10/2025.
//




import Observation
import CoreLocation
import MapKit

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var location: CLLocation?

    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Erreur lors de la récupération de la localisation : \(error.localizedDescription)")
    }
}

// pour compléter les adresses
@Observable
class SearchCompleter: NSObject, MKLocalSearchCompleterDelegate {
    var results: [MKLocalSearchCompletion] = []
    var searchCompleter = MKLocalSearchCompleter()
    
    // configuration de la limitation des résultats pour la france
    let franceCenter = CLLocationCoordinate2D(latitude: 46.6, longitude: 2.4)
    let franceSpan = MKCoordinateSpan(latitudeDelta: 5.5, longitudeDelta: 7.0)
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.region = MKCoordinateRegion(center: franceCenter, span: franceSpan)
        
    }
    
    func updateResults(for query: String) {
        searchCompleter.queryFragment = query
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        
        self.results = completer.results
        print(completer.results)
    }
}

@Observable
class GeocoderService: NSObject {
    
    func translateSearchStringInCoordinate(searchString: String) async -> MKCoordinateRegion?  {
              if let request = MKGeocodingRequest(addressString: searchString) {
            do {
                let mapItems = try await request.mapItems
                let coordinates = CLLocationCoordinate2D(
                    latitude: mapItems.first?.location.coordinate.latitude ?? 0,
                    longitude: mapItems.first?.location.coordinate.longitude ?? 0
                )
                let span = MKCoordinateSpan(
                    latitudeDelta: 0.01,
                    longitudeDelta: 0.01
                )
                let region = MKCoordinateRegion(
                    center: coordinates,
                    span: span
                )
                print(region)
                
                return region
                
                
            } catch {
                print ("error: \(error)")
                return nil
            }
        }
        return nil
    }
}
    

