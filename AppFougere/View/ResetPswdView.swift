//
//  ResetPswdView.swift
//  AppFougere
//
//  Created by apprenant114 on 31/10/2025.
//
import SwiftUI

struct ResetPswdView: View {
    // MARK: - Bindings
    @Binding var isLogin: Bool  // Permet de revenir à la connexion

    // MARK: - State
    @State private var phone: String = ""
    @State private var sentCode: String = ""  // ⬅️ ajouté
    @State private var goDefine: Bool = false  // ⬅️ ajouté

    // MARK: - Validation
    private var isPhoneValid: Bool {
        let phoneRegex = /^[0-9]{10}$/  // 10 chiffres
        return phone.wholeMatch(of: phoneRegex) != nil
    }

    // MARK: - Body
    var body: some View {
        NavigationStack {  // ⬅️ ajouté pour la navigation
            VStack(spacing: 32) {
                // MARK: Titre
                Text("Réinitialiser le mot de passe")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.capVerde)
                    .multilineTextAlignment(.center)

                // MARK: Champ téléphone
                CustomTextField(
                    placeholder: "Numéro de téléphone",
                    text: $phone,
                    systemImage: "phone"
                )
                .keyboardType(.numberPad)

                // MARK: Avertissement si numéro invalide
                if !isPhoneValid && !phone.isEmpty {
                    Text("Numéro de téléphone invalide (10 chiffres attendus).")
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                // MARK: Bouton envoyer le code
                Button("Envoyer le code") {
                    let verificationCode = generateVerificationCode()
                    sentCode = verificationCode  // ⬅️ stocke le code
                    Task {
                        await sendSMS(
                            number: phone,
                            verifCode: verificationCode
                        )
                    }
                    goDefine = true  // ⬅️ navigue vers la sous-vue
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    isPhoneValid ? Color.capVerde : Color.gray.opacity(0.4)
                )
                .foregroundStyle(.chefHat)
                .cornerRadius(30)
                .disabled(!isPhoneValid)

                // MARK: Bouton retour connexion
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

            // ⬅️ Destination de navigation : la sous-vue de redéfinition
            .navigationDestination(isPresented: $goDefine) {
                ResetPswdDefineView(
                    isLogin: $isLogin,
                    phone: phone,
                    expectedCode: sentCode
                )
            }
        }.padding(.horizontal, 32)
    }
}

#Preview {
    ResetPswdView(isLogin: .constant(true))
}
