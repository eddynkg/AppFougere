//
//  RegisterView.swift
//  AppFougere
//
//  Created by apprenant114 on 27/10/2025.
//

import SwiftUI

struct RegisterView: View {
    // MARK: - Propriétés d’état
    @Binding var isLogin: Bool
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false

    // MARK: - Validation du formulaire
    private var isEmailValid: Bool {
        let emailRegex = /^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/
        return email.wholeMatch(of: emailRegex) != nil
    }

    private var doPasswordsMatch: Bool {
        password == confirmPassword && !password.isEmpty
    }

    private var isFormValid: Bool {
        !username.isEmpty && isEmailValid && doPasswordsMatch
    }

    // MARK: - Corps de la vue
    var body: some View {
        VStack(spacing: 32) {
            // MARK: - Titre
            Text("S'enregistrer")
                .font(.largeTitle.bold())
                .foregroundStyle(.capVerde)

            // MARK: - Champs de saisie
            CustomTextField(
                placeholder: "Identifiant",
                text: $username,
                systemImage: "person"
            )

            CustomTextField(
                placeholder: "E-mail",
                text: $email,
                systemImage: "envelope"
            )
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)

            CustomSecureField(
                placeholder: "Mot de passe",
                text: $password,
                showPassword: $showPassword,
                regexOn: true
            )

            CustomSecureField(
                placeholder: "Confirmer le mot de passe",
                text: $confirmPassword,
                showPassword: $showConfirmPassword,
                regexOn: false
            )

            // MARK: - Messages d’erreur
            VStack(alignment: .leading, spacing: 4) {
                if !isEmailValid && !email.isEmpty {
                    Text("Adresse e-mail invalide.")
                        .foregroundColor(.red)
                        .font(.caption)
                }

                if !doPasswordsMatch && !confirmPassword.isEmpty {
                    Text("Les mots de passe ne correspondent pas.")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }

            // MARK: - Bouton d’enregistrement
            Button("S'enregistrer") {
                print("Inscription validée")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isFormValid ? Color.capVerde : Color.gray.opacity(0.4))
            .foregroundStyle(.chefHat)
            .cornerRadius(30)
            .disabled(!isFormValid)

            // MARK: - Lien vers la connexion
            Button(action: {
                isLogin = true
            }) {
                VStack(spacing: 4) {
                    HStack(spacing: 0) {
                        Text("Déjà un compte ? ")
                        Text("Connexion").bold()
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.capVerde)
                }.fixedSize()
            }.foregroundStyle(.capVerde)
        }.animation(.easeInOut, value: isFormValid)
    }
}

// MARK: - Aperçu
#Preview {
    RegisterView(isLogin: .constant(false))
}
