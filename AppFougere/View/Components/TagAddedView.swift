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
    @Query var tagsOnActivity: [TagOnActivity] = []
    @Query var tags: [Tag] = []
    @Environment(\.modelContext) var context
    var tagViewModel = TagViewModel()
    
    
    
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Tags :")
                    .font(.title2)
                    .fontWeight(.bold)
                TextField("Chercher un tag", text: $searchedTag)
            }
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(tagViewModel.filterExistingTags(tags: tags, searchText: searchedTag)) { tag in
                        TagComponent(tag: tag)
                    }
                    Button(action: {
                        let addedTag = Tag(title: "Campagne")
                        context.insert(addedTag)
                    }) {
                        Image(systemName:"plus.app")
                    }
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    TagAddedView()
}
