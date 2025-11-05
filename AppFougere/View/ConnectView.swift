//
//  RegisterView.swift
//  AppFougere
//
//  Created by apprenant114 on 29/10/2025.
//

import SwiftUI

struct ConnectView: View {
    // MARK: - Session & navigation
    @EnvironmentObject var session: SessionManager          // Accès au gestionnaire de session
    @Binding var isLogin: Bool                              // true = écran de connexion, false = inscription
    @AppStorage("isLoggedIn") private var isLoggedIn = false // Doit utiliser la même clé que ContentView

    // MARK: - Saisie utilisateur
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

    // MARK: - Interface
    var body: some View {
        VStack(spacing: 32) {
            // Titre
            Text("Connexion")
                .font(.largeTitle.bold())
                .foregroundStyle(.capVerde)

            // Identifiant
            CustomTextField(
                placeholder: "Identifiant",
                text: $username,
                systemImage: "person"
            )
            .textContentType(.username)
            .textInputAutocapitalization(.never)

            // Mot de passe + lien d’aide
            VStack {
                CustomSecureField(
                    placeholder: "Mot de passe",
                    text: $password,
                    showPassword: $showPassword,
                    regexOn: false
                )

                NavigationLink(
                    "Mot de passe oublié ?",
                    destination: ResetPswdView(isLogin: $isLogin)
                )
                .foregroundStyle(.capVerde)
                .font(.subheadline)
                .padding(.leading, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            // Action de connexion
            Button("Connexion") {
                session.login(username: username)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.capVerde)
            .foregroundStyle(.chefHat)
            .cornerRadius(30)

            // Lien vers l’inscription
            Button {
                isLogin = false
            } label: {
                VStack(spacing: 4) {
                    HStack(spacing: 0) {
                        Text("Pas encore de compte ? ")
                        Text("Inscription").bold()
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.capVerde)
                }
                .fixedSize()
            }
            .foregroundStyle(.capVerde)
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    ConnectView(isLogin: .constant(true))
        .environmentObject(SessionManager())
}
