//
//  ActivityPicture.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import SwiftUI
import Observation

@Observable
class ActivityPicture {
    var id : UUID = UUID()
    var userId : UUID
    var activityId : UUID
    var content: Image
    var date: Date
    
    init(id: UUID, userId: UUID, activityId: UUID, content: Image, date: Date) {
        self.id = id
        self.userId = userId
        self.activityId = activityId
        self.content = content
        self.date = date
    }
}
