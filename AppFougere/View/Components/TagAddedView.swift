//
//  TagAddedView.swift
//  AppFougere
//
//  Created by Basile Carle on 28/10/2025.
//

import Foundation
import SwiftUI
import SwiftData

struct TagAddedView: View {
    @State var searchedTag: String = ""
    @State var newTagName: String = ""
    @Query var tagsOnActivity: [TagOnActivity] = []
    @Query var tags: [Tag] = []
    @Environment(\.modelContext) var context
    var tagViewModel = TagViewModel()
    
    
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    var body: some View {
        
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
                    ForEach(tagViewModel.filterExistingTags(tags: tags, searchText: searchedTag)) { tag in
                        TagComponent(tag: tag)
                            .padding(8)
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)

            }
        }
        .padding()
        
    }
}

#Preview {
    TagAddedView()
}
