//
//  TagComponent.swift
//  AppFougere
//
//  Created by Basile Carle on 28/10/2025.
//

import SwiftUI

struct TagComponent: View {
    var tag: Tag
    
    var body: some View {
        
        if tag.isVisible {
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
                    .foregroundStyle(Color.accentColor)
                    .frame(height: 30)
                )
                Button(action: tag.closeTagDisplay) {
                    Image(systemName: "xmark")
                        .font(.system(size: 12))
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
                    .foregroundStyle(Color.accentColor)
                    .frame(height: 30)
                )
            }
            
        }
        
    }
}

#Preview {
    var tag: Tag = Tag(title: "Montagne")
    TagComponent(tag: tag)
}
