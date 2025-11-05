//
//  CustomSecureField.swift
//  AppFougere
//
//  Created by apprenant114 on 30/10/2025.
//

import SwiftUI

/// Champ de mot de passe personnalisé avec bouton d’affichage et validation optionnelle.
struct CustomSecureField: View {
    // MARK: - Propriétés
    var placeholder: String                 // Texte indicatif
    @Binding var text: String               // Contenu saisi
    @Binding var showPassword: Bool         // Affichage/masquage du mot de passe
    var regexOn: Bool = false               // Active la validation du format

    // MARK: - Validation (8+ caractères, 1 majuscule, 1 chiffre)
    private let passwordRegex = #"^(?=.*[A-Z])(?=.*[0-9]).{8,}$"#
    private let validationMessage = "Au moins 8 caractères, 1 majuscule et 1 chiffre"

    private var isValid: Bool {
        text.range(of: passwordRegex, options: .regularExpression) != nil
    }

    // MARK: - Interface
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Champ principal
            HStack {
                Image(systemName: "lock")
                    .foregroundStyle(.capVerde)

                // TextField ou SecureField selon l’état
                ZStack {
                    SecureField(placeholder, text: $text)
                        .opacity(showPassword ? 0 : 1)
                    TextField(placeholder, text: $text)
                        .opacity(showPassword ? 1 : 0)
                }
                .animation(nil, value: showPassword)
                .foregroundStyle(.capVerde)

                // Bouton œil
                Button {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        showPassword.toggle()
                    }
                } label: {
                    Image(systemName: showPassword ? "eye" : "eye.slash")
                        .foregroundStyle(.capVerde)
                }
            }
            .padding()
            .background(Color.chefHat)
            .cornerRadius(30)

            // Message de validation
            if regexOn && !text.isEmpty && !isValid {
                Text(validationMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.leading, 4)
            }
        }
    }
}
