//
//  AuthView.swift
//  AppFougere
//
//  Created by apprenant114 on 30/10/2025.
//

import SwiftUI

/// Vue d’authentification principale.
/// Gère la navigation entre la connexion et l’inscription.
struct AuthView: View {
    // MARK: - État
    @State private var isLogin = true  // true = affichage de la connexion, false = inscription

    // MARK: - Interface
    var body: some View {
        NavigationStack {
            if isLogin {
                ConnectView(isLogin: $isLogin)
            } else {
                RegisterView(isLogin: $isLogin)
            }
        }
    }
}

// MARK: - Aperçu
#Preview {
    AuthView()
        .environmentObject(SessionManager())
}
