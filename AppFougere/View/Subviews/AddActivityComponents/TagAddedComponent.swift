//
//  TagAddedView.swift
//  AppFougere
//
//  Created by Basile Carle on 28/10/2025.
//

import Foundation
import SwiftUI
import SwiftData

struct TagAddedComponent: View {
    
    @Query var createdTags: [Tag] = []
    @Environment(\.modelContext) var context
    var tagViewModel = TagViewModel()
    
    @State var searchedTag: String = ""
    @Binding var tagsToAddToActivity: [Tag]
    
 
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    var body: some View {

        VStack {

            HStack {
                Text("Tags :")
                    .frame(width: 60)
                    .customBody(bold: true, color: .capVerde)
                TextField("Nom du tag à ajouter", text: $searchedTag)
                    .padding(8)
                    .textInputAutocapitalization(.never)
                Spacer()
                
               
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(
                        tagViewModel
                            .filterExistingTags(tags: createdTags, searchText: searchedTag) as! [Tag]
                    ) { tag in
                        
                        TagComponent(tag: tag, displayMode: .addToActivity, tagsToAddToActivity: $tagsToAddToActivity, searchedTag: $searchedTag)
                    }
                    ForEach(tagsToAddToActivity) { tag in
                        TagComponent(tag: tag, displayMode: .removeFromActivity, tagsToAddToActivity: $tagsToAddToActivity, searchedTag: $searchedTag)
                            .padding(8)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            

            
        }
        
        
    }
    

}








