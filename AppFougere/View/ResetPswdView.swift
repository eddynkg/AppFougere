//
//  ResetPswdView.swift
//  AppFougere
//
//  Created by apprenant114 on 31/10/2025.
//
import SwiftUI

struct ResetPswdView: View {
    // MARK: - Binding
    @Binding var isLogin: Bool  // Indique si l’écran de connexion doit être affiché

    // MARK: - State
    @State private var phone: String = ""
    @State private var sentCode: String = ""     // Code de vérification envoyé
    @State private var goDefine: Bool = false    // Déclenche la navigation vers la vue suivante

    // MARK: - Validation du numéro
    private var isPhoneValid: Bool {
        let phoneRegex = /^[0-9]{10}$/  // Vérifie que le numéro contient exactement 10 chiffres
        return phone.wholeMatch(of: phoneRegex) != nil
    }

    // MARK: - Interface
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                // Titre principal
                Text("Réinitialiser le mot de passe")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.capVerde)
                    .multilineTextAlignment(.center)

                // Champ de saisie du numéro de téléphone
                CustomTextField(
                    placeholder: "Numéro de téléphone",
                    text: $phone,
                    systemImage: "phone"
                )
                .keyboardType(.numberPad)

                // Message d’erreur si le numéro est invalide
                if !isPhoneValid && !phone.isEmpty {
                    Text("Numéro de téléphone invalide (10 chiffres attendus).")
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                // Bouton d’envoi du code de vérification
                Button("Envoyer le code") {
                    let verificationCode = generateVerificationCode()
                    sentCode = verificationCode
                    Task {
                        await sendSMS(
                            number: phone,
                            verifCode: verificationCode
                        )
                    }
                    goDefine = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    isPhoneValid ? Color.capVerde : Color.gray.opacity(0.4)
                )
                .foregroundStyle(.chefHat)
                .cornerRadius(30)
                .disabled(!isPhoneValid)

                // Lien pour revenir à l’écran de connexion
                Button(action: {
                    isLogin = true
                }) {
                    VStack(spacing: 4) {
                        HStack(spacing: 0) {
                            Text("Retour à la ")
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
            .animation(.easeInOut, value: isPhoneValid)

            // Navigation vers la vue de définition du nouveau mot de passe
            .navigationDestination(isPresented: $goDefine) {
                ResetPswdDefineView(
                    isLogin: $isLogin,
                    phone: phone,
                    expectedCode: sentCode
                )
            }
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    ResetPswdView(isLogin: .constant(true))
}
