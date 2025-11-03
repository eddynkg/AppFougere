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
    @State private var email: String = ""
    
    // MARK: - Validation
    private var isEmailValid: Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 32) {
            
            // MARK: Titre
            Text("Réinitialiser le mot de passe")
                .font(.largeTitle.bold())
                .foregroundStyle(.capVerde)
                .multilineTextAlignment(.center)
            
            // MARK: Champ e-mail
            CustomTextField(
                placeholder: "E-mail",
                text: $email,
                systemImage: "envelope"
            )
            .keyboardType(.emailAddress)
            
            // MARK: Avertissement si e-mail invalide
            if !isEmailValid && !email.isEmpty {
                Text("Adresse e-mail invalide.")
                    .foregroundColor(.red)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            // MARK: Bouton envoyer lien
            Button("Envoyer le lien") {
                print("Lien de réinitialisation envoyé à \(email)")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isEmailValid ? Color.capVerde : Color.gray.opacity(0.4))
            .foregroundStyle(.chefHat)
            .cornerRadius(30)
            .disabled(!isEmailValid)
            
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
        .padding(.horizontal, 32)
        .animation(.easeInOut, value: isEmailValid)
    }
}

#Preview {
    ResetPswdView(isLogin: .constant(true))
}
