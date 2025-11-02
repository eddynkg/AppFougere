//
//  Note.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Rating: Identifiable {
    
    var id: UUID = UUID()
    var userId: UUID
    var activityId: UUID
    var rating: Int         // Between 1 and 5
    
    init(userId: UUID, activityId: UUID, rating: Int) {
        self.userId = userId
        self.activityId = activityId
        self.rating = rating
    }
}
