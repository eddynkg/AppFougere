//
//  RatingData.swift
//  AppFougere
//
//  Created by JulietteM on 02/11/2025.
//

import Foundation
import SwiftData

// --- Datas for activities' rating ---

let ratings: [Rating] = [
    // 0 - 4
    Rating(userId: users[0].id, activityId: activities[0].id, rating: 5),
    Rating(userId: users[1].id, activityId: activities[1].id, rating: 4),
    Rating(userId: users[2].id, activityId: activities[2].id, rating: 5),
    Rating(userId: users[3].id, activityId: activities[3].id, rating: 3),
    Rating(userId: users[4].id, activityId: activities[4].id, rating: 4),

    // 5 - 9
    Rating(userId: users[5].id, activityId: activities[5].id, rating: 5),
    Rating(userId: users[6].id, activityId: activities[6].id, rating: 4),
    Rating(userId: users[7].id, activityId: activities[7].id, rating: 5),
    Rating(userId: users[8].id, activityId: activities[8].id, rating: 3),
    Rating(userId: users[9].id, activityId: activities[9].id, rating: 4),

    // 10 - 14
    Rating(userId: users[10].id, activityId: activities[10].id, rating: 5),
    Rating(userId: users[11].id, activityId: activities[11].id, rating: 4),
    Rating(userId: users[12].id, activityId: activities[12].id, rating: 5),
    Rating(userId: users[13].id, activityId: activities[13].id, rating: 3),
    Rating(userId: users[14].id, activityId: activities[14].id, rating: 5),

    // 15 - 19
    Rating(userId: users[15].id, activityId: activities[15].id, rating: 4),
    Rating(userId: users[16].id, activityId: activities[16].id, rating: 5),
    Rating(userId: users[17].id, activityId: activities[17].id, rating: 3),
    Rating(userId: users[18].id, activityId: activities[18].id, rating: 4),
    Rating(userId: users[19].id, activityId: activities[19].id, rating: 5),

    // 20 - 24
    Rating(userId: users[0].id, activityId: activities[5].id, rating: 4),
    Rating(userId: users[1].id, activityId: activities[7].id, rating: 5),
    Rating(userId: users[2].id, activityId: activities[9].id, rating: 3),
    Rating(userId: users[3].id, activityId: activities[10].id, rating: 5),
    Rating(userId: users[4].id, activityId: activities[12].id, rating: 4),

    // 25 - 29
    Rating(userId: users[5].id, activityId: activities[14].id, rating: 5),
    Rating(userId: users[6].id, activityId: activities[15].id, rating: 3),
    Rating(userId: users[7].id, activityId: activities[16].id, rating: 5),
    Rating(userId: users[8].id, activityId: activities[17].id, rating: 4),
    Rating(userId: users[9].id, activityId: activities[18].id, rating: 5),

    // 30 - 34
    Rating(userId: users[10].id, activityId: activities[0].id, rating: 3),
    Rating(userId: users[11].id, activityId: activities[1].id, rating: 4),
    Rating(userId: users[12].id, activityId: activities[2].id, rating: 5),
    Rating(userId: users[13].id, activityId: activities[3].id, rating: 5),
    Rating(userId: users[14].id, activityId: activities[4].id, rating: 3),

    // 35 - 39
    Rating(userId: users[15].id, activityId: activities[6].id, rating: 4),
    Rating(userId: users[16].id, activityId: activities[8].id, rating: 5),
    Rating(userId: users[17].id, activityId: activities[9].id, rating: 5),
    Rating(userId: users[18].id, activityId: activities[11].id, rating: 4),
    Rating(userId: users[19].id, activityId: activities[13].id, rating: 3),

    // 40 - 44
    Rating(userId: users[0].id, activityId: activities[15].id, rating: 5),
    Rating(userId: users[1].id, activityId: activities[16].id, rating: 4),
    Rating(userId: users[2].id, activityId: activities[17].id, rating: 3),
    Rating(userId: users[3].id, activityId: activities[18].id, rating: 5),
    Rating(userId: users[4].id, activityId: activities[19].id, rating: 4),

    // 45 - 49
    Rating(userId: users[5].id, activityId: activities[1].id, rating: 5),
    Rating(userId: users[6].id, activityId: activities[2].id, rating: 3),
    Rating(userId: users[7].id, activityId: activities[4].id, rating: 5),
    Rating(userId: users[8].id, activityId: activities[6].id, rating: 4),
    Rating(userId: users[9].id, activityId: activities[8].id, rating: 5),

    // 50 - 54
    Rating(userId: users[10].id, activityId: activities[10].id, rating: 3),
    Rating(userId: users[11].id, activityId: activities[12].id, rating: 5),
    Rating(userId: users[12].id, activityId: activities[14].id, rating: 4),
    Rating(userId: users[13].id, activityId: activities[15].id, rating: 5),
    Rating(userId: users[14].id, activityId: activities[17].id, rating: 3),

    // 55 - 59
    Rating(userId: users[15].id, activityId: activities[19].id, rating: 5),
    Rating(userId: users[16].id, activityId: activities[0].id, rating: 4),
    Rating(userId: users[17].id, activityId: activities[2].id, rating: 5),
    Rating(userId: users[18].id, activityId: activities[5].id, rating: 3),
    Rating(userId: users[19].id, activityId: activities[7].id, rating: 4),
]
