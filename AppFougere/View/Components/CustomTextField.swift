//
//  CustomTextField.swift
//  AppFougere
//
//  Created by apprenant114 on 30/10/2025.
//

import SwiftUI

/// Champ de texte générique avec une icône à gauche.
/// Utilisé pour les saisies simples comme identifiant, e-mail ou téléphone.
struct CustomTextField: View {
    // MARK: - Propriétés
    var placeholder: String        // Texte indicatif
    @Binding var text: String      // Contenu saisi
    var systemImage: String        // Icône SF Symbol affichée à gauche

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
