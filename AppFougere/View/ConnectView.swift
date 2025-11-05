//
//  ConnectView.swift
//  AppFougere
//

import SwiftUI

struct ConnectView: View {
    @Binding var isLogin: Bool
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

    var body: some View {
        VStack(spacing: 32) {
            // Titre
            Text("Connexion")
                .font(.largeTitle.bold())
                .foregroundStyle(.capVerde)

            // Champ identifiant
            CustomTextField(
                placeholder: "Identifiant",
                text: $username,
                systemImage: "person"
            )
            .textContentType(.username)
            .textInputAutocapitalization(.never)
            VStack {
                // Champ mot de passe
                CustomSecureField(
                    placeholder: "Mot de passe",
                    text: $password,
                    showPassword: $showPassword,
                    regexOn: false
                )

                // Mot de passe oublié → navigation
                NavigationLink(
                    "Mot de passe oublié ?",
                    destination: ResetPswdView(isLogin: $isLogin)
                )
                .foregroundStyle(.capVerde)
                .font(.subheadline)
                .padding(.leading, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            // Bouton Connexion
            Button("Connexion") {
                print("Connexion")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.capVerde)
            .foregroundStyle(.chefHat)
            .cornerRadius(30)

            // Bouton vers Inscription
            Button(action: {
                isLogin = false
            }) {
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
    }
}

#Preview {
    NavigationStack {
        ConnectView(isLogin: .constant(true))
    }
}
