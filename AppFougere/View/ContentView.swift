//
//  ContentView.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionManager

    var body: some View {
        if session.isLoggedIn {
            HomeView()
        } else {
            AuthView()
        }
    }
}

#Preview("Déconnecté") {
    let session = SessionManager()
    session.logout()
    return ContentView()
        .environmentObject(session)
}

#Preview("Connecté") {
    let session = SessionManager()
    session.login(username: "Eddy")
    return ContentView()
        .environmentObject(session)
}
