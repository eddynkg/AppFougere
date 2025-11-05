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
    @StateObject private var session = SessionManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(session)
        }
        .modelContainer(
            for: [
                TagOnActivity.self,
                Tag.self,
                Activity.self,
                ActivityPicture.self,
                User.self,
            ]
        )
    }
}
