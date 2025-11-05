//
//  CustomTextField.swift
//  AppFougere
//
//  Created by apprenant114 on 30/10/2025.
//

import SwiftUI

/// Champ de texte personnalisé avec icône à gauche.
/// Peut servir pour les identifiants, e-mails, etc.
struct CustomTextField: View {
    
    // MARK: - Propriétés
    var placeholder: String
    @Binding var text: String
    var systemImage: String
    
    // MARK: - Corps de la vue
    var body: some View {
        HStack {
            
            // MARK: Icône à gauche
            Image(systemName: systemImage)
                .foregroundStyle(.capVerde)
            
            // MARK: Champ texte
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
