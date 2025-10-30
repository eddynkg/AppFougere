//
//  AppFougereApp.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import SwiftUI
import SwiftData

@main
struct AppFougereApp: App {
    var body: some Scene {
        WindowGroup {
            AddActivityView()
        }
        .modelContainer(for: [TagOnActivity.self, Tag.self, Activity.self, ActivityPicture.self, User.self])
    }
}
