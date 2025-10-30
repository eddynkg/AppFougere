//
//  Tag.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import SwiftUI
import Observation

@Observable
class Comment {
    var id : UUID = UUID()
    var userId : UUID
    var activityId : UUID
    var content: String
    var date: Date
    
    init(userId: UUID, activityId: UUID, content: String, date: Date) {
        self.userId = userId
        self.activityId = activityId
        self.content = content
        self.date = date
    }
}
