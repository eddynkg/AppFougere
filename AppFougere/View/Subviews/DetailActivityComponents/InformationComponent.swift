//
//  InformationComponent.swift
//  AppFougere
//
//  Created by Eddy Charles on 30/10/2025.
//

import SwiftUI

struct InformationComponent: View {
    let activity: Activity
    let author: User
    
    var body: some View {
        HStack (spacing: 1){
            NavigationLink {
                ProfileView()
            } label: {
                // Photo de profil de l'auteur de l'activité
                Group {
                    if let pictureName = author.profilePicture, !pictureName.isEmpty {
                        Image(pictureName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } else {
                        // Fallback si pas d'image définie
                        Image("user11")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding()
            }
            .buttonStyle(.plain)
            
            VStack (alignment: .leading , spacing: 4){
                // Nom de l'utilisateur
                Text("\(author.userName)")
                    .font(.title2)
                    .bold()
                HStack {
                    Image(systemName: "mappin.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.capVerde)
                    VStack {
                        // Localisation de l'activité
                        Text(activity.location)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.capVerde)
                        // Nom de l'activité
                        Text(activity.name)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundStyle(.capVerde)
                    }
                }
                
            }
            // Exemple de note statique (à remplacer si tu as une vraie note)
            Text("5")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.capVerde)
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.capVerde)
                
        }
    }
}

#Preview {
    // Données factices pour la Preview
    let demoUser = User(
        userName: "Fanny",
        email: "fanny@example.com",
        password: "password",
        bio: "Bio demo",
        profilePicture: "user11"
    )
    let demoActivity = Activity(
        name: "Randonnée de Bonnieux",
        actDescription: "Une belle rando dans le Luberon",
        location: "Le Luberon, France",
        difficulty: 3.0,
        handicap: true,
        userId: demoUser.id,
        accessibility: [.foot],
        durationHour: 3,
        durationMin: 30
    )
    NavigationStack {
        InformationComponent(activity: demoActivity, author: demoUser)
    }
}
