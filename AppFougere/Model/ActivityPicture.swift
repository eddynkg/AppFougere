//
//  ActivityPicture.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class ActivityPicture: Identifiable {
    var id: UUID = UUID()
    var activityId: UUID
    var actContent: String // Picture's name
    var date: Date
    @Attribute(.externalStorage)
    var image: Data?
    
    init(activityId: UUID, actContent: String, date: Date, image: Data?) {
        self.activityId = activityId
        self.actContent = actContent
        self.date = date
        self.image = image
    }
}



