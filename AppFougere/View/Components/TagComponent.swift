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
        Button("\(tag.title)") {
            
        }
        .padding()
        .foregroundStyle(Color.white)
        .background(
            Capsule()
                .foregroundStyle(Color.accentColor)
        )
        Text("")
    }
}

#Preview {
    var tag: Tag = Tag(title: "Montagne")
    TagComponent(tag: tag)
}
