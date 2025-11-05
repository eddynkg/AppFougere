//
//  CustomSecureField.swift
//  AppFougere
//
//  Créé le 30/10/2025
//

import SwiftUI

struct CustomSecureField: View {

    // MARK: - Propriétés externes
    var placeholder: String  // Texte affiché quand le champ est vide
    @Binding var text: String  // Texte saisi par l'utilisateur
    @Binding var showPassword: Bool  // Booléen pour afficher ou masquer le mot de passe
    var regexOn: Bool = false  // Booléen pour activer ou non la validation regex

    // MARK: - Regex interne pour validation
    private let passwordRegex = #"^(?=.*[A-Z])(?=.*[0-9]).{8,}$"#
    private let validationMessage =
        "Au moins 8 caractères, 1 majuscule et 1 chiffre"

    // MARK: - Validation
    /// Booléen indiquant si le texte saisi correspond à la regex interne
    var isValid: Bool {
        text.range(of: passwordRegex, options: .regularExpression) != nil
    }

    // MARK: - Corps de la vue
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {

            // HStack principal du champ
            HStack {

                // Icône cadenas
                Image(systemName: "lock")
                    .foregroundStyle(.capVerde)

                // Champ mot de passe masqué ou visible
                ZStack {
                    SecureField(placeholder, text: $text)
                        .opacity(showPassword ? 0 : 1)
                    TextField(placeholder, text: $text)
                        .opacity(showPassword ? 1 : 0)
                }
                // IMPORTANT : désactiver l’animation implicite pour éviter le pop-in
                .animation(nil, value: showPassword)
                .foregroundStyle(.capVerde)

                // Bouton œil pour afficher/masquer le mot de passe
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
            .background(.chefHat)
            .cornerRadius(30)

            // Affichage d'un message si la regex est activée et que le mot de passe est invalide
            if regexOn && !text.isEmpty && !isValid {
                Text(validationMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.leading, 4)
            }
        }
    }
}
