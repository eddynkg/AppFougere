//
//  ResetPswdView.swift
//  AppFougere
//
//  Created by apprenant114 on 31/10/2025.
//
import SwiftUI

struct ResetPswdView: View {
    // MARK: - Navigation
    @Binding var isLogin: Bool  // Permet de revenir à l’écran de connexion

    // MARK: - États
    @State private var phone: String = ""  // Numéro de téléphone saisi
    @State private var sentCode: String = ""  // Code de vérification généré
    @State private var goDefine: Bool = false  // Déclenche la navigation vers la suite

    // MARK: - Validation du numéro
    private var isPhoneValid: Bool {
        let phoneRegex = /^[0-9]{10}$/  // Doit contenir exactement 10 chiffres
        return phone.wholeMatch(of: phoneRegex) != nil
    }

    // MARK: - Interface
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                // Titre
                Text("Réinitialiser le mot de passe")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.capVerde)
                    .multilineTextAlignment(.center)

                // Champ de saisie du téléphone
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

                // Bouton d’envoi du code par SMS
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

            }
            .animation(.easeInOut, value: isPhoneValid)

            // Navigation vers l’écran de définition du nouveau mot de passe
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
