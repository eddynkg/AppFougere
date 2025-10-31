//
//  TagComponent.swift
//  AppFougere
//
//  Created by Basile Carle on 28/10/2025.
//

import SwiftUI
import SwiftData

struct TagComponent: View {
    @Bindable var tag: Tag
    @Environment(\.modelContext) var context
    @State var displayMode: TagDisplayMode
    @Binding var tagsToAddToActivity: [Tag]
    @Binding var searchedTag: String
    
    @State var isActionButtonDisplayed: Bool = true
    
    
    var body: some View {
        
        if displayMode != .tagDisplay {
            
            HStack(spacing: 0){
                Button("\(tag.title)") {
                    
                }
                .padding(.leading, 12)
                .padding(.trailing, 4)
                .foregroundColor(.white)
                .background(
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 15,
                        bottomLeading: 15,
                        bottomTrailing: 0,
                        topTrailing: 0),
                                           style: .continuous
                    )
                    .foregroundStyle( displayMode == .addToActivity ? Color.accentColor.opacity(0.6) : Color.accentColor)
                    .frame(height: 30)
                )
                Button(action: {
                    switch displayMode {
                    case .addToActivity:
                        tagsToAddToActivity.append(tag)
                        searchedTag = ""
                    case .removeFromActivity:
                        searchedTag = ""
                        let tagUuidToRemove = tag.id
                        tagsToAddToActivity = tagsToAddToActivity.filter { tagToAddToActivity in
                            tagToAddToActivity.id != tagUuidToRemove
                        }
                    case .tagDisplay:
                        print("display tag")
                    case .tagCreation:
                        context.delete(tag)
                    }
                }) {
                    if displayMode == .addToActivity {
                        
                        Image(systemName: "plus.circle")
                            .font(.system(size: 18))
                            .padding(.vertical, 16)
                        
                    } else if displayMode == .removeFromActivity || displayMode == .tagCreation {
                        Image(systemName: "xmark")
                            .font(.system(size: 12))
                    }
                }
                .foregroundColor(.white)
                .padding(.leading, 4)
                .padding(.trailing, 12)
                .background(
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 0,
                        bottomLeading: 0,
                        bottomTrailing: 15,
                        topTrailing: 15),
                                           style: .continuous
                    )
                    .foregroundStyle(displayMode == .addToActivity ? Color.accentColor.opacity(0.6) : Color.accentColor)
                    .frame(height: 30)
                )
            }
        }
        
        
        // si on est en mode tagDisplay, on n'affiche pas de bouton
        else {
            HStack(spacing: 0){
                Button("\(tag.title)") {
                    
                }
                .padding(.leading, 12)
                .padding(.trailing, 12)
                .foregroundColor(.white)
                .background(
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 15,
                        bottomLeading: 15,
                        bottomTrailing: 15,
                        topTrailing: 15),
                                           style: .continuous
                    )
                    .foregroundStyle(Color.accentColor)
                    .frame(height: 30)
                )

            }
        }
            
        
        
    }
}

#Preview {
   
    var tag: Tag = Tag(title: "Montagne")
    TagComponent(tag: tag, displayMode: .addToActivity, tagsToAddToActivity: .constant([]), searchedTag: .constant(""))
}
