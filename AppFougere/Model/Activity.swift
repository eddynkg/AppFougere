//
//  Activity.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Activity: Identifiable {
    var id: UUID = UUID()
    var name: String
    var actDescription: String
    var location: String
    var difficulty: Double
    var handicap: Bool
    var userId: UUID
    var accessibility: [Accessibility]
    
    init(name: String, actDescription: String, location: String, difficulty: Double, handicap: Bool, userId: UUID, accessibility: [Accessibility]) {
        self.name = name
        self.actDescription = actDescription
        self.location = location
        self.difficulty = difficulty
        self.handicap = handicap
        self.userId = userId
        self.accessibility = accessibility
    }
    
}

enum Accessibility: String, Codable {
    case car, foot, bike, metro, bus, tramway, train
}
