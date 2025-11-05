//
//  AdminView.swift
//  AppFougere
//
//  Created by Basile Carle on 29/10/2025.
//

import Foundation
import SwiftUI
import SwiftData

struct AdminView: View {

    // MARK: - Sources SwiftData (requêtes en lecture)
    @Query var tagsOnActivity: [TagOnActivity] = []   // Table de jointure Tag ↔︎ Activity
    @Query var tags: [Tag] = []                       // Liste des tags
    @Query var activitiesSD: [Activity] = []          // Liste des activités
    @Query var usersSD: [User] = []                   // Liste des utilisateurs

    // MARK: - Contexte d’écriture SwiftData
    @Environment(\.modelContext) var context

    // MARK: - États locaux (sélection/filtre/inputs)
    @State var tagsToAddToActivity: [Tag] = []        // Sélection temporaire de tags (utilisée par TagComponent)
    var tagViewModel = TagViewModel()

    @State var newTagName: String = ""                // Saisie du nom d’un tag à créer
    @State var searchedTag: String = ""               // Filtre textuel transmis au TagComponent

    // MARK: - Interface
    var body: some View {
        Form {
            // =========================
            // Section : TAGS
            // =========================
            Section("Tags") {
                VStack {

                    // En-tête + bouton de chargement
                    HStack {
                        Text("Tags :")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: {
                            loadTagsIntoSwiftData()
                        }) {
                            Text("Charger")
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundStyle(Color.capVerde)
                                )
                        }
                    }

                    // Création rapide d’un tag
                    HStack {
                        TextField("Nom du tag à ajouter", text: $newTagName)
                        Button(action: {
                            let addedTag = Tag(title: "\(newTagName)")
                            context.insert(addedTag)  // Persiste un nouveau Tag
                        }) {
                            Image(systemName:"plus.app")
                        }
                    }

                    // Liste des tags existants (avec composant dédié)
                    ScrollView {
                        ForEach(tags) { tag in
                            TagComponent(
                                tag: tag,
                                displayMode: .tagCreation,
                                tagsToAddToActivity: $tagsToAddToActivity,
                                searchedTag: $searchedTag
                            )
                            .padding(8)
                        }
                    }
                }
                .padding(.horizontal, 8)
            }

            // =========================
            // Section : Jointure TagOnActivity
            // =========================
            Section("Jointure Tags et Activités") {
                HStack {
                    Text("TagsOnActivity :")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        // Emplacement réservé si besoin de recharger/rafraîchir
                    }) {
                        Text("Charger")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundStyle(Color.capVerde.opacity(0.2))
                            )
                    }
                }

                // Liste des liaisons Tag ↔︎ Activity avec suppression
                ScrollView {
                    ForEach(tagsOnActivity) { tagOnActivity in
                        HStack {
                            Text("id :")
                                .fontWeight(.bold)
                            Text(String(tagOnActivity.id.uuidString))
                            Spacer()
                            Button(action: {
                                context.delete(tagOnActivity) // Supprime la jointure
                            }) {
                                Text("Supprimer")
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .foregroundColor(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .foregroundStyle(Color.capVerde)
                                    )
                            }
                        }
                    }
                }
            }

            // =========================
            // Section : ACTIVITÉS
            // =========================
            Section("Activités") {
                HStack {
                    Text("Activités :")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        loadActivitiesIntoSwiftData()
                    }) {
                        Text("Charger")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundStyle(Color.capVerde)
                            )
                    }
                }

                // Liste des activités avec suppression
                ScrollView {
                    ForEach(activitiesSD) { activity in
                        HStack {
                            Text("Nom :")
                                .fontWeight(.bold)
                            Text(activity.name)
                            Spacer()
                            Button(action: {
                                context.delete(activity) // Supprime l’activité
                            }) {
                                Text("Supprimer")
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .foregroundColor(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .foregroundStyle(Color.capVerde)
                                    )
                            }
                        }
                    }
                }
            }

            // =========================
            // Section : UTILISATEURS
            // =========================
            Section("Utilisateurs") {
                HStack {
                    Text("Utilisateurs :")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        loadUsersIntoSwiftData()
                    }) {
                        Text("Charger")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundStyle(Color.capVerde)
                            )
                    }
                }

                // Liste des utilisateurs avec suppression
                ScrollView {
                    ForEach(usersSD) { user in
                        HStack {
                            Text("Nom :")
                                .fontWeight(.bold)
                            Text(user.userName)
                            Spacer()
                            Button(action: {
                                context.delete(user) // Supprime l’utilisateur
                            }) {
                                Text("Supprimer")
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .foregroundColor(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .foregroundStyle(Color.capVerde)
                                    )
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: - Chargements (inserts en base)
    func loadActivitiesIntoSwiftData() {
        for activity in activities {
            context.insert(activity)
        }
    }

    func loadUsersIntoSwiftData() {
        for user in users {
            context.insert(user)
        }
    }

    func loadTagsIntoSwiftData() {
        for tag in tags {
            context.insert(tag)
        }
    }
}

#Preview {
    AdminView()
}
