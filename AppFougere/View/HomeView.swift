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
                
                // HScroll if there is selected tags
                
                
                
                // Double button to switch between list and map
                HStack {
                    
            // List button
                    Button {
                        selectedListView = true
                    } label: {
                        ZStack {
                            if selectedListView {
                                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, bottomLeading: 30))
                                    .frame(width: 160, height: 40)
                                    .foregroundStyle(.capVerde)
                                
                                Text("Liste")
                                    .customSubtitle(bold: false, color: .chefHat)
                            } else {
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
                            if selectedListView {
                                UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: 30, topTrailing: 30))
                                    .frame(width: 160, height: 40)
                                    .foregroundStyle(.chefHat)
                                
                                Text("Carte")
                                    .customSubtitle(bold: false, color: .capVerde)
                            } else {
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
                    ListHomeView()
                } else {
                    MapHomeView()
                }
                    
            }
        }
    }
}

#Preview {
    HomeView()
}
