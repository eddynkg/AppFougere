//
//  FavoriteData.swift
//  AppFougere
//
//  Created by JulietteM on 02/11/2025.
//

import Foundation
import SwiftData

// --- Datas for favorites ---

let favorites: [Favorite] = [
    Favorite(
        userId: users[0].id,
        activityId: activities[0].id,
        date: Date(timeIntervalSinceNow: -86400 * 1)
    ),  // 0
    Favorite(
        userId: users[1].id,
        activityId: activities[2].id,
        date: Date(timeIntervalSinceNow: -86400 * 3)
    ),  // 1
    Favorite(
        userId: users[2].id,
        activityId: activities[5].id,
        date: Date(timeIntervalSinceNow: -86400 * 2)
    ),  // 2
    Favorite(
        userId: users[3].id,
        activityId: activities[1].id,
        date: Date(timeIntervalSinceNow: -86400 * 7)
    ),  // 3
    Favorite(
        userId: users[4].id,
        activityId: activities[4].id,
        date: Date(timeIntervalSinceNow: -86400 * 5)
    ),  // 4
    Favorite(
        userId: users[5].id,
        activityId: activities[8].id,
        date: Date(timeIntervalSinceNow: -86400 * 9)
    ),  // 5
    Favorite(
        userId: users[6].id,
        activityId: activities[6].id,
        date: Date(timeIntervalSinceNow: -86400 * 4)
    ),  // 6
    Favorite(
        userId: users[7].id,
        activityId: activities[3].id,
        date: Date(timeIntervalSinceNow: -86400 * 10)
    ),  // 7
    Favorite(
        userId: users[8].id,
        activityId: activities[7].id,
        date: Date(timeIntervalSinceNow: -86400 * 6)
    ),  // 8
    Favorite(
        userId: users[9].id,
        activityId: activities[10].id,
        date: Date(timeIntervalSinceNow: -86400 * 8)
    ),  // 9
    Favorite(
        userId: users[10].id,
        activityId: activities[11].id,
        date: Date(timeIntervalSinceNow: -86400 * 12)
    ),  // 10
    Favorite(
        userId: users[11].id,
        activityId: activities[9].id,
        date: Date(timeIntervalSinceNow: -86400 * 14)
    ),  // 11
    Favorite(
        userId: users[12].id,
        activityId: activities[13].id,
        date: Date(timeIntervalSinceNow: -86400 * 11)
    ),  // 12
    Favorite(
        userId: users[13].id,
        activityId: activities[12].id,
        date: Date(timeIntervalSinceNow: -86400 * 15)
    ),  // 13
    Favorite(
        userId: users[14].id,
        activityId: activities[15].id,
        date: Date(timeIntervalSinceNow: -86400 * 13)
    ),  // 14
    Favorite(
        userId: users[15].id,
        activityId: activities[14].id,
        date: Date(timeIntervalSinceNow: -86400 * 17)
    ),  // 15
    Favorite(
        userId: users[16].id,
        activityId: activities[16].id,
        date: Date(timeIntervalSinceNow: -86400 * 20)
    ),  // 16
    Favorite(
        userId: users[17].id,
        activityId: activities[18].id,
        date: Date(timeIntervalSinceNow: -86400 * 19)
    ),  // 17
    Favorite(
        userId: users[18].id,
        activityId: activities[17].id,
        date: Date(timeIntervalSinceNow: -86400 * 16)
    ),  // 18
    Favorite(
        userId: users[19].id,
        activityId: activities[20].id,
        date: Date(timeIntervalSinceNow: -86400 * 22)
    ),  // 19
    Favorite(
        userId: users[20].id,
        activityId: activities[1].id,
        date: Date(timeIntervalSinceNow: -86400 * 25)
    ),  // 20
    Favorite(
        userId: users[0].id,
        activityId: activities[2].id,
        date: Date(timeIntervalSinceNow: -86400 * 18)
    ),  // 21
    Favorite(
        userId: users[3].id,
        activityId: activities[4].id,
        date: Date(timeIntervalSinceNow: -86400 * 21)
    ),  // 22
    Favorite(
        userId: users[5].id,
        activityId: activities[5].id,
        date: Date(timeIntervalSinceNow: -86400 * 23)
    ),  // 23
    Favorite(
        userId: users[7].id,
        activityId: activities[8].id,
        date: Date(timeIntervalSinceNow: -86400 * 24)
    ),  // 24
    Favorite(
        userId: users[9].id,
        activityId: activities[6].id,
        date: Date(timeIntervalSinceNow: -86400 * 27)
    ),  // 25
    Favorite(
        userId: users[11].id,
        activityId: activities[10].id,
        date: Date(timeIntervalSinceNow: -86400 * 26)
    ),  // 26
    Favorite(
        userId: users[13].id,
        activityId: activities[13].id,
        date: Date(timeIntervalSinceNow: -86400 * 28)
    ),  // 27
    Favorite(
        userId: users[15].id,
        activityId: activities[12].id,
        date: Date(timeIntervalSinceNow: -86400 * 29)
    ),  // 28
    Favorite(
        userId: users[17].id,
        activityId: activities[9].id,
        date: Date(timeIntervalSinceNow: -86400 * 30)
    ),  // 29
    Favorite(
        userId: users[19].id,
        activityId: activities[14].id,
        date: Date(timeIntervalSinceNow: -86400 * 31)
    ),  // 30
    Favorite(
        userId: users[1].id,
        activityId: activities[16].id,
        date: Date(timeIntervalSinceNow: -86400 * 32)
    ),  // 31
    Favorite(
        userId: users[4].id,
        activityId: activities[18].id,
        date: Date(timeIntervalSinceNow: -86400 * 34)
    ),  // 32
    Favorite(
        userId: users[6].id,
        activityId: activities[17].id,
        date: Date(timeIntervalSinceNow: -86400 * 33)
    ),  // 33
    Favorite(
        userId: users[8].id,
        activityId: activities[20].id,
        date: Date(timeIntervalSinceNow: -86400 * 35)
    ),  // 34
    Favorite(
        userId: users[10].id,
        activityId: activities[19].id,
        date: Date(timeIntervalSinceNow: -86400 * 36)
    ),  // 35
    Favorite(
        userId: users[12].id,
        activityId: activities[11].id,
        date: Date(timeIntervalSinceNow: -86400 * 37)
    ),  // 36
    Favorite(
        userId: users[14].id,
        activityId: activities[3].id,
        date: Date(timeIntervalSinceNow: -86400 * 38)
    ),  // 37
    Favorite(
        userId: users[16].id,
        activityId: activities[7].id,
        date: Date(timeIntervalSinceNow: -86400 * 40)
    ),  // 38
    Favorite(
        userId: users[18].id,
        activityId: activities[15].id,
        date: Date(timeIntervalSinceNow: -86400 * 42)
    ),  // 39
]
