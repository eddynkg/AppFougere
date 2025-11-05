//
//  ContentView.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Session
    @EnvironmentObject var session: SessionManager  // Source de vérité : connecté/déconnecté

    // MARK: - Interface
    var body: some View {
        // Routeur minimal : Home si connecté, sinon flux d’authentification
        if session.isLoggedIn {
            TabBarView()
        } else {
            AuthView()
        }
    }
}

// MARK: - Aperçus
#Preview("Déconnecté") {
    let session = SessionManager()
    session.logout()  // Force l’état déconnecté pour l’aperçu
    return ContentView()
        .environmentObject(session)
}

#Preview("Connecté") {
    let session = SessionManager()
    session.login(username: "Eddy")  // Simule une session active
    return ContentView()
        .environmentObject(session)
}
