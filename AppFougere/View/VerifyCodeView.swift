//
//  VerifyCodeView.swift
//  AppFougere
//
//  Created by apprenant114 on 31/10/2025.
//

import SwiftUI

struct VerifyCodeView: View {
    @Binding var isLogin: Bool

    @State private var verificationCode: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var showNewPassword: Bool = false
    @State private var showConfirmPassword: Bool = false

    // MARK: - Validation properties
    private var doPasswordsMatch: Bool {
        !newPassword.isEmpty && newPassword == confirmPassword
    }

    private var isFormValid: Bool {
        !verificationCode.isEmpty && doPasswordsMatch
    }

    var body: some View {
        VStack(spacing: 32) {
            // Titre
            Text("Réinitialiser le mot de passe")
                .font(.largeTitle.bold())
                .foregroundStyle(.capVerde)
                .multilineTextAlignment(.center)

            // Champ code de vérification
            CustomTextField(
                placeholder: "Code de vérification",
                text: $verificationCode,
                systemImage: "number"
            )
            .keyboardType(.numberPad)

            // Nouveau mot de passe
            CustomSecureField(
                placeholder: "Nouveau mot de passe",
                text: $newPassword,
                showPassword: $showNewPassword,
                regexOn: true
            )

            // Confirmation mot de passe
            CustomSecureField(
                placeholder: "Confirmer le mot de passe",
                text: $confirmPassword,
                showPassword: $showConfirmPassword,
                regexOn: false
            )

            // Avertissement si les mots de passe ne correspondent pas
            if !doPasswordsMatch && !confirmPassword.isEmpty {
                Text("Les mots de passe ne correspondent pas.")
                    .foregroundColor(.red)
                    .font(.caption)
            }

            // Bouton valider
            Button("Valider") {
                print("Nouveau mot de passe enregistré")
                // Ici tu peux rediriger vers login
                isLogin = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isFormValid ? Color.capVerde : Color.gray.opacity(0.4))
            .foregroundStyle(.chefHat)
            .cornerRadius(30)
            .disabled(!isFormValid)
        }
        .padding(32)
        .animation(.easeInOut, value: isFormValid)
    }
}

#Preview {
    VerifyCodeView(isLogin: .constant(false))
}
