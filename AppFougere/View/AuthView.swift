//
//  AuthView.swift
//  AppFougere
//
//  Created by apprenant114 on 30/10/2025.
//

import SwiftUI

struct AuthView: View {
    // MARK: - État d’affichage
    @State private var isLogin = true  // true = écran de connexion, false = inscription

    // MARK: - Interface
    var body: some View {
        NavigationStack {
            ScrollView {

                if isLogin {
                    ConnectView(isLogin: $isLogin)
                } else {
                    RegisterView(isLogin: $isLogin)
                }
            }
        }
    }
}

// MARK: - Aperçu
#Preview {
    AuthView()
        .environmentObject(SessionManager())
}
