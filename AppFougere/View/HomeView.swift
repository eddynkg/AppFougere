//
//  HomeView.swift
//  AppFougere
//
//  Created by JulietteM on 27/10/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedListView = true
    
    var body: some View {
        NavigationStack {
            
            VStack {
                // Search bar with filter button
                
                HStack {
                    
                    TagAddedComponent()
                        .frame(width: 280, height: 50)
                        .background(.chefHat)
                        .cornerRadius(90)
                    
                    FilterComponent()
                }
                .padding()
                
                // HScroll if there is selected tags
                
                // if [tags] is empty show scrollview
//                ScrollView(.horizontal) {
//                    
//                }
                
                // Double button to switch between list and map
                HStack {
                    
            // List button
                    Button {
                        selectedListView = true
                    } label: {
                        ZStack {
                            if selectedListView { // List is selected
                                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, bottomLeading: 30))
                                    .frame(width: 160, height: 40)
                                    .foregroundStyle(.capVerde)
                                
                                Text("Liste")
                                    .customSubtitle(bold: false, color: .chefHat)
                            } else { // Map is selected
                                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, bottomLeading: 30))
                                    .frame(width: 160, height: 40)
                                    .foregroundStyle(.chefHat)
                                
                                Text("Liste")
                                    .customSubtitle(bold: false, color: .capVerde)
                            }
                        }
                    }
                    .padding(.horizontal, -4)

                    
            // Map button
                    Button {
                        selectedListView = false
                    } label: {
                        ZStack {
                            if selectedListView { // List is selected
                                UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: 30, topTrailing: 30))
                                    .frame(width: 160, height: 40)
                                    .foregroundStyle(.chefHat)
                                
                                Text("Carte")
                                    .customSubtitle(bold: false, color: .capVerde)
                            } else { // Map is selected
                                UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: 30, topTrailing: 30))
                                    .frame(width: 160, height: 40)
                                    .foregroundStyle(.capVerde)
                                    
                                
                                Text("Carte")
                                    .customSubtitle(bold: false, color: .chefHat)
                            }
                            
                        }
                    }
                    .padding(.horizontal, -4)

                }
                
                
                // Deal with the View's change
                if selectedListView {
                    // List is selected so show List View
                    ListHomeView()
                } else {
                    // Map is selected so show Map View
                    MapHomeView()
                }
                    
            }
        }
    }
}

#Preview {
    HomeView()
}
