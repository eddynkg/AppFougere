//
//  ContentView.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Session
    @EnvironmentObject var session: SessionManager  // Contrôle l’état connecté/déconnecté

    // MARK: - Interface
    var body: some View {
        if session.isLoggedIn {
            HomeView()   // Écran principal une fois connecté
        } else {
            AuthView()   // Flux d’authentification (connexion/inscription)
        }
    }
}

// MARK: - Aperçus
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
