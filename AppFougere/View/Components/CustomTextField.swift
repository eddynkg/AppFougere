//
//  CustomTextField.swift
//  AppFougere
//
//  Created by apprenant114 on 30/10/2025.
//

import SwiftUI

/// Champ de texte avec icône intégrée à gauche.
/// Utilisé pour les saisies simples : identifiant, téléphone, e-mail, etc.
struct CustomTextField: View {
    // MARK: - Propriétés
    var placeholder: String
    @Binding var text: String
    var systemImage: String

    // MARK: - Interface
    var body: some View {
        HStack {
            // Icône à gauche
            Image(systemName: systemImage)
                .foregroundStyle(.capVerde)

            // Zone de saisie
            TextField(placeholder, text: $text)
                .foregroundStyle(.capVerde)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
        }
        .padding()
        .background(Color.chefHat)
        .cornerRadius(30)
    }
}

#Preview {
    CustomTextField(
        placeholder: "Identifiant",
        text: .constant("MonIdentifiant"),
        systemImage: "person"
    )
}
