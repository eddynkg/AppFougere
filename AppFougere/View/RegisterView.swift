//
//  RegisterView.swift
//  AppFougere
//
//  Created by apprenant114 on 29/10/2025.
//

import SwiftUI

struct RegisterView: View {
    // MARK: - Navigation
    @Binding var isLogin: Bool

    // MARK: - États de saisie
    @State private var username: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false

    // MARK: - Validation
    private var isPhoneValid: Bool {
        // 10 chiffres consécutifs (ex. FR sans séparateur)
        let phoneRegex = /^[0-9]{10}$/
        return phone.wholeMatch(of: phoneRegex) != nil
    }
    private var doPasswordsMatch: Bool {
        password == confirmPassword && !password.isEmpty
    }
    private var isFormValid: Bool {
        !username.isEmpty && isPhoneValid && doPasswordsMatch
    }

    // MARK: - Interface
    var body: some View {
        VStack(spacing: 32) {
            // Titre
            Text("S'inscrire")
                .font(.largeTitle.bold())
                .foregroundStyle(.capVerde)

            // Identifiant
            CustomTextField(
                placeholder: "Identifiant",
                text: $username,
                systemImage: "person"
            )

            // Téléphone
            CustomTextField(
                placeholder: "Numéro de téléphone",
                text: $phone,
                systemImage: "phone"
            )
            .keyboardType(.numberPad)
            .textInputAutocapitalization(.never)

            // Mot de passe
            CustomSecureField(
                placeholder: "Mot de passe",
                text: $password,
                showPassword: $showPassword,
                regexOn: true
            )

            // Confirmation mot de passe
            CustomSecureField(
                placeholder: "Confirmer le mot de passe",
                text: $confirmPassword,
                showPassword: $showConfirmPassword,
                regexOn: false
            )

            // Messages d’erreur
            VStack(alignment: .leading, spacing: 4) {
                if !isPhoneValid && !phone.isEmpty {
                    Text("Numéro de téléphone invalide (10 chiffres attendus).")
                        .foregroundColor(.red)
                        .font(.caption)
                }
                if !doPasswordsMatch && !confirmPassword.isEmpty {
                    Text("Les mots de passe ne correspondent pas.")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }

            // Action d’inscription (envoi du code)
            Button("S'inscrire") {
                let verificationCode = generateVerificationCode()
                Task {
                    await sendSMS(number: phone, verifCode: verificationCode)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isFormValid ? Color.capVerde : Color.gray.opacity(0.4))
            .foregroundStyle(.chefHat)
            .cornerRadius(30)
            .disabled(!isFormValid)

            // Lien vers la connexion
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
                }
                .fixedSize()
            }
            .foregroundStyle(.capVerde)
        }
        .padding(.horizontal, 32)
        .animation(.easeInOut, value: isFormValid)
    }
}

// MARK: - Aperçu
#Preview {
    RegisterView(isLogin: .constant(false))
}
