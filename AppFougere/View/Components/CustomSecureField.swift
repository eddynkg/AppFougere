//
//  CustomSecureField.swift
//  AppFougere
//
//  Created by apprenant114 on 30/10/2025.
//

import SwiftUI

/// Champ de saisie sécurisé avec affichage/masquage du mot de passe.
/// Optionnellement, vérifie la conformité du mot de passe via une regex.
struct CustomSecureField: View {
    // MARK: - Propriétés
    var placeholder: String             // Texte indicatif
    @Binding var text: String           // Contenu saisi
    @Binding var showPassword: Bool     // Contrôle d’affichage du texte
    var regexOn: Bool = false           // Active ou non la vérification du format

    // MARK: - Validation du mot de passe
    private let passwordRegex = #"^(?=.*[A-Z])(?=.*[0-9]).{8,}$"#
    private let validationMessage = "Au moins 8 caractères, 1 majuscule et 1 chiffre"

    private var isValid: Bool {
        text.range(of: passwordRegex, options: .regularExpression) != nil
    }

    // MARK: - Interface
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Conteneur principal
            HStack {
                // Icône cadenas
                Image(systemName: "lock")
                    .foregroundStyle(.capVerde)

                // Zone de saisie : SecureField ou TextField selon l’état
                ZStack {
                    SecureField(placeholder, text: $text)
                        .opacity(showPassword ? 0 : 1)
                    TextField(placeholder, text: $text)
                        .opacity(showPassword ? 1 : 0)
                }
                .animation(nil, value: showPassword)
                .foregroundStyle(.capVerde)

                // Bouton pour basculer la visibilité
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

            // Message d’erreur si la validation est activée et échoue
            if regexOn && !text.isEmpty && !isValid {
                Text(validationMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.leading, 4)
            }
        }
    }
}
