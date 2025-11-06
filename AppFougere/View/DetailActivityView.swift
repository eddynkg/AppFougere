//
//  DetailActivityView.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import SwiftUI
import SwiftData

struct DetailActivityView: View {
    @Query var activityPicturesSD: [ActivityPicture] = []
    
    
    
    let activity: Activity
    var isSwiftData: Bool?
    
    @Environment(\.dismiss) private var dismiss
    @State private var isBookmarked: Bool = false
    
    // ViewModel pour récupérer les tags liés (variante A - mocks)
    private let tagOnActivityVM = TagOnActivityViewModel()
    
    // Récupération de l'auteur depuis une source globale `users`
    private var author: User {
        if let found = users.first(where: { $0.id == activity.userId }) {
            return found
        } else {
            // Fallback si aucun user correspondant n'est trouvé
            return User(
                userName: "Utilisateur",
                email: "inconnu@example.com",
                password: "password",
                bio: nil,
                profilePicture: "user11"
            )
        }
    }
    
    var body: some View {
        // Contenu principal de la vue détail
        ScrollView {
            VStack {
                // Image principale liée à l’activité (via helper sur Activity)
                if isSwiftData == false || isSwiftData == nil { // si l'on charge l'image avec le nom de l'image
                    
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
                }
                else {
                    // si l'on charge l'image directement avec swiftData
                    if isSwiftData == true {
                        let imagesDataArray = activity.getActivityPicture(
                            activity: activity,
                            activityPictures: activityPicturesSD
                        )
                        if let imagesToLoad = imagesDataArray as? [UIImage] {
                            if let uiImageToDisplay = imagesToLoad.first {
                                Image(uiImage: uiImageToDisplay)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 320, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding(8)
                            }
                        }
                
                    }
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
                
                // Information Component (passe l'activité et l'auteur)
                InformationComponent(activity: activity, author: author)
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
                
                // Commentaires
                CommentsComponent(activity: activity, comments: comments, users: users)
                    .padding(.top, 8)
                    .padding(.bottom, 24)
                
                // Toolbar
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        
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
        // “Activité 20” = index 20 (Le Colorado français)
        DetailActivityView(activity: activities[20])
    }
}
