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
class ActivityPicture {
    var id: UUID = UUID()
    var activityId: UUID
    var actContent: String
    var date: Date
    
    init(activityId: UUID, actContent: String, date: Date) {
        self.activityId = activityId
        self.actContent = actContent
        self.date = date
    }
}
