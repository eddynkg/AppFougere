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
    @State private var isBookmarked: Bool = false

    // ViewModel pour récupérer les tags liés (variante A - mocks)
    private let tagOnActivityVM = TagOnActivityViewModel()

    var body: some View {
        // Contenu principal de la vue détail
        ScrollView {
            VStack {
                // Image principale liée à l’activité (via helper sur Activity)
                if let imageName = activity.mainPictureName(from: activityPictures) {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 320, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(8)
                } else {
                    // Fallback si aucune image n’est associée
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundStyle(.capVerde)
                        .padding(.top, 24)
                }
                
                // Tags réels de l'activité (via ViewModel et données mockées)
                ScrollView(.horizontal) {
                    HStack(spacing: 8) {
                        let activityTags = tagOnActivityVM.tagsForActivity(activity)
                        if activityTags.isEmpty {
                            Text("Aucun tag")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Capsule().fill(Color.capVerde))
                        } else {
                            ForEach(activityTags) { tag in
                                Text(tag.title)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(
                                        Capsule().fill(Color.capVerde)
                                    )
                            }
                        }
                    }
                    .padding(.leading, 10)
                }
                .scrollIndicators(.hidden)
                
                // Information Component
                InformationComponent()
                    .padding(.horizontal, 12)
                
                // Map (pour l'instant photo)
                Image("mapColorado")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 360, height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                //Line
                Divider()
                    .padding(.top, 16)
                    .frame(width: 360)

                //ActDescriptionComponent
                ActDescriptionComponent(activity: activity)
                    .padding(.top, 8)
                
                //Line
                Divider()
                    .padding(.top, 16)
                    .frame(width: 360)
                
                //Activités aux alentours
                OtherActivitiesComponent()
                
                //Line
                Divider()
                    .padding(.top, 16)
                    .frame(width: 360)
                
                // Toolbar
                .navigationBarTitleDisplayMode(.inline)
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
                            .foregroundStyle(.white)
                    }
                    
                    // Bouton enregistrement à droite
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isBookmarked.toggle()
                        } label: {
                            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
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
            accessibility: [.foot, .car, .bus],
            durationHour: 2,
            durationMin: 20
        ))
        // “Activité 20” = index 20 (Le Colorado français)
        DetailActivityView(activity: activities[20])
    }
}
