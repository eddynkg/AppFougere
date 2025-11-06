//
//  Activity.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import SwiftData
import SwiftUI
import CoreLocation
import MapKit




@Model
class Activity: Identifiable {
    var id: UUID = UUID()
    var name: String
    var actDescription: String
    var location: String // A changer ?
    var difficulty: Double
    var handicap: Bool
    var userId: UUID
    var accessibility: [Accessibility]
    var durationHour: Int
    var durationMin: Int
    
    init(
        name: String,
        actDescription: String,
        location: String, // A changer ?
        difficulty: Double,
        handicap: Bool,
        userId: UUID,
        accessibility: [Accessibility],
        durationHour: Int,
        durationMin: Int
    ) {
        self.name = name
        self.actDescription = actDescription
        self.location = location
        self.difficulty = difficulty
        self.handicap = handicap
        self.userId = userId
        self.accessibility = accessibility
        self.durationHour = durationHour
        self.durationMin = durationMin
    }
    
}

enum Accessibility: String, Codable {
    case car, foot, bike, metro, bus, tramway, train, publicTransportation
}

// MARK: - Helpers
extension Activity {
    // Retourne le nom de l’image la plus récente associée à l’activité
    func mainPictureName(from pictures: [ActivityPicture]) -> String? {
        // Filtrer les photos appartenant à cette activité
        let relatedPictures: [ActivityPicture] = pictures.filter { picture in
            return picture.activityId == self.id
        }
        // Trier par date décroissante (plus récente en premier)
        let sortedPictures: [ActivityPicture] = relatedPictures.sorted { left, right in
            return left.date > right.date
        }
        // Retourner le nom de la première image si disponible
        if let first = sortedPictures.first {
            return first.actContent
        } else {
            return nil
        }
    }
    
    
    func getActivityPicture(activity: Activity, activityPictures: [ActivityPicture]) -> [UIImage?] {
        
        let activityPicture: [ActivityPicture] = activityPictures.filter { picture in
            picture.activityId == activity.id
        }
        var pictureUIImage: [UIImage?] = []
        for picture in activityPicture {
            if let pictureData = picture.image {
                let pictureToLoad = UIImage(data: pictureData)
                pictureUIImage.append(pictureToLoad)
            }
        }

        return pictureUIImage
    }
     
}
