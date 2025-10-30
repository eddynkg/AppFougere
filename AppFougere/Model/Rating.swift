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
class Rating{
    
    var id : UUID = UUID()
    var userId : UUID
    var activityId : UUID
    var rating: Int
    
    init(userId: UUID, activityId: UUID, rating: Int) {
        self.userId = userId
        self.activityId = activityId
        self.rating = rating
    }
}
