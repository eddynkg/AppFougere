//
//  RegisterView.swift
//  AppFougere
//
//  Created by apprenant114 on 29/10/2025.
//

import SwiftUI

struct RegisterView: View {
    // MARK: - Propriétés d’état
    @Binding var isLogin: Bool
    @State private var username: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false

    // MARK: - Validation du formulaire
    private var isPhoneValid: Bool {
        // Expression très simple : 10 chiffres (tu peux la raffiner selon ton besoin)
        let phoneRegex = /^[0-9]{10}$/
        return phone.wholeMatch(of: phoneRegex) != nil
    }

    private var doPasswordsMatch: Bool {
        password == confirmPassword && !password.isEmpty
    }

    private var isFormValid: Bool {
        !username.isEmpty && isPhoneValid && doPasswordsMatch
    }

    // MARK: - Corps de la vue
    var body: some View {
        VStack(spacing: 32) {
            // MARK: - Titre
            Text("S'inscrire")
                .font(.largeTitle.bold())
                .foregroundStyle(.capVerde)

            // MARK: - Champs de saisie
            CustomTextField(
                placeholder: "Identifiant",
                text: $username,
                systemImage: "person"
            )

            CustomTextField(
                placeholder: "Numéro de téléphone",
                text: $phone,
                systemImage: "phone"
            )
            .keyboardType(.numberPad)
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

            // MARK: - Bouton d’enregistrement
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
            }
            .foregroundStyle(.capVerde)
        }.padding(.horizontal, 32)
        .animation(.easeInOut, value: isFormValid)
    }
}

// MARK: - Aperçu
#Preview {
    RegisterView(isLogin: .constant(false))
}
