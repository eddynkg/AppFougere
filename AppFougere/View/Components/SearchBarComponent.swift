//
//  SearchBarComponent.swift
//  AppFougere
//
//  Created by JulietteM on 30/10/2025.
//

import SwiftUI

struct SearchBarComponent: View {
    
    @State var searchText: String = ""
    
//    var filteredAnimals : [Tag] {
//            guard !searchText.isEmpty else {
//                return tags }
//            return tags.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
//        }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SearchBarComponent()
}
