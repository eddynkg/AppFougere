//
//  Favorite.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable
class Favorite {
    var id: UUID = UUID()
    var userId: UUID
    var activityId: UUID
    var date: Date
    
    init(userId: UUID, activityId: UUID, date: Date) {
        self.userId = userId
        self.activityId = activityId
        self.date = date
    }
}
