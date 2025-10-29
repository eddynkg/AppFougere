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
    @Query var tagsOnActivity: [TagOnActivity] = []
    @Query var tags: [Tag] = []
    @Environment(\.modelContext) var context
    var tagViewModel = TagViewModel()
    
    @State var searchedTag: String = ""
    @State var newTagName: String = ""
    @State var tagsToAddToActivity: [Tag] = []
    
    
    
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
                TextField("Nom du tag à ajouter", text: $searchedTag)
                
               
            }
            HStack {
                ForEach(tagViewModel.filterExistingTags(tags: tags, searchText: searchedTag) as! [Tag]) { tag in
                    
                    TagComponent(tag: tag, displayMode: .addToActivity, tagsToAddToActivity: $tagsToAddToActivity, searchedTag: $searchedTag)
                }
                ForEach(tagsToAddToActivity) { tag in
                    TagComponent(tag: tag, displayMode: .removeFromActivity, tagsToAddToActivity: $tagsToAddToActivity, searchedTag: $searchedTag)
                        .padding(8)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            Spacer()
            

        }
        .padding()
        
    }
}

#Preview {
    TagAddedView()
}
