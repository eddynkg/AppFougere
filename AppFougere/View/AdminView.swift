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
    
    @Query var tagsOnActivity: [TagOnActivity] = []
    @Query var tags: [Tag] = []
    @Query var activitiesSD: [Activity] = []
    @Query var usersSD: [User] = []
    
    @Environment(\.modelContext) var context
    @State var tagsToAddToActivity: [Tag] = [] // a prioiri inutile ici
    var tagViewModel = TagViewModel()
    
    @State var newTagName: String = ""
    @State var searchedTag: String = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    var body: some View {
        Form {
            Section("Tags") {
                VStack {
                    
                    HStack {
                        Text("Tags :")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        Button(
                            action: {
                                loadTagsIntoSwiftData()
                            }
                        ) {
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
                    HStack {
                        TextField("Nom du tag à ajouter", text: $newTagName)
                        Button(action: {
                            let addedTag = Tag(title: "\(newTagName)")
                            context.insert(addedTag)
                        }) {
                            Image(systemName:"plus.app")
                        }
                    }
                    
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(tags) { tag in
                                TagComponent(tag: tag, displayMode: .tagCreation, tagsToAddToActivity: $tagsToAddToActivity, searchedTag: $searchedTag)
                                    .padding(8)
                            }
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                }
                .padding(.horizontal, 8)
            }
            Section("Jointure Tags et Activités") {
                HStack {
                    Text("TagsOnActivity :")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(
                        action: {
                            
                        }
                    ) {
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
                ScrollView {
                    ForEach(tagsOnActivity) { tagOnActivity in
                        HStack {
                            Text("id :")
                                .fontWeight(.bold)
                            Text(String(tagOnActivity.id.uuidString))
                            Spacer()
                            Button(
                                action: {
                                    context.delete(tagOnActivity)
                                }
                            ) {
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
            Section("Activités") {
                HStack {
                    Text("Activités :")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(
                        action: {
                            loadActivitiesIntoSwiftData()
                        }
                    ) {
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
                ScrollView {
                    ForEach(activitiesSD) { activity in
                        HStack {
                            Text("Nom :")
                                .fontWeight(.bold)
                            Text(activity.name)
                            Spacer()
                            Button(
                                action: {
                                    context.delete(activity)
                                }
                            ) {
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
            
            Section("Utilisateurs") {
                HStack {
                    Text("Utilisateurs :")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(
                        action: {
                            loadUsersIntoSwiftData()
                        }
                    ) {
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
                ScrollView {
                    ForEach(usersSD) { user in
                        HStack {
                            Text("Nom :")
                                .fontWeight(.bold)
                            Text(user.userName)
                            Spacer()
                            Button(
                                action: {
                                    context.delete(user)
                                }
                            ) {
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






