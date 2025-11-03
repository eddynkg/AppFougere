//
//  AuthView.swift
//  AppFougere
//
//  Created by apprenant114 on 30/10/2025.
//

import SwiftUI

struct AuthView: View {
    // MARK: - Propriétés d’état
    @State private var isLogin: Bool = true

    // MARK: - Corps de la vue
    var body: some View {
        VStack {
            // MARK: - Navigation entre Connexion et Inscription
            if isLogin {
                ConnectView(isLogin: $isLogin)  // Vue de connexion
            } else {
                RegisterView(isLogin: $isLogin)  // Vue d’inscription
            }
        }
        .animation(.easeInOut, value: isLogin)
        .padding(.horizontal, 32)
    }
}

// MARK: - Aperçu
#Preview {
    AuthView()
}
