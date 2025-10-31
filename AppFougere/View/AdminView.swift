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
                .padding()
            }
        }
    }
}

#Preview {
    AdminView()
}






