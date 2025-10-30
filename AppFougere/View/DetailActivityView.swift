//
//  DetailActivityView.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import SwiftUI

struct DetailActivityView: View {
    let activity: Activity

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        // Contenu principal de la vue détail
        ScrollView {
            VStack {
                Image("colorado")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 320, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(8)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<5) { _ in
                            Text("Colorado")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(
                                    Capsule().fill(Color.capVerde)
                                )
                        }
                    }
                    .padding(.leading, 10)
                }
                .scrollIndicators(.hidden)
                
                // Information Component
                InformationComponent()
                    .padding(.horizontal, 12)
                
                .navigationBarTitleDisplayMode(.inline)
                
                // Toolbar
                .toolbar {
                    // Bouton retour à gauche
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .symbolRenderingMode(.monochrome)
                                .foregroundStyle(.white)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    // Titre centré
                    ToolbarItem(placement: .principal) {
                        Text(activity.name)
                            .font(.headline)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .foregroundStyle(.white) // Titre en blanc
                    }
                    
                    // Bouton enregistrement à droite
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            // TODO: action de signature
                        } label: {
                            Image(systemName: "bookmark")
                                .symbolRenderingMode(.monochrome)
                                .foregroundStyle(.white)
                        }
                        .buttonStyle(.plain)
                    }
                }
                // Couleur des éléments interactifs (icônes/boutons)
                .tint(.white)
                // Fond de la barre en capVerde et visible
                .toolbarBackground(.capVerde, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        DetailActivityView(activity: Activity(
            name: "Colorado français",
            actDescription: "Une rando incroyable dans le Luberon ! 😍 On se croirait dans un mini Colorado avec ces falaises ocres rouges et jaunes. Le contraste avec la végétation est fou. Une vraie claque visuelle, à faire absolument si vous êtes dans la région ! 🏜️✨",
            location: "Lubéron, France",
            difficulty: 2.5,
            handicap: true,
            userId: UUID(),
            accessibility: [.foot, .car, .bus]
        ))
    }
}
