//
//  Activity.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable
class Activity {
    var id: UUID = UUID()
    var name: String
    var description : String
    var location: String
    var difficulty: Double //
    var handicap: Bool
    var userId : UUID
    var accessibility: [Accessibility]
    
    init(id: UUID, name: String, description: String, location: String, difficulty: Double, handicap: Bool, userId: UUID, accessibility: [Accessibility]) {
        self.id = id
        self.name = name
        self.description = description
        self.location = location
        self.difficulty = difficulty
        self.handicap = handicap
        self.userId = userId
        self.accessibility = accessibility
    }
    
}

enum Accessibility: String, Codable {
    case car, foot, bike, metro, bus, tramway, other
}
