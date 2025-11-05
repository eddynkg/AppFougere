//
//  HomeView.swift
//  AppFougere
//
//  Created by JulietteM on 27/10/2025.
//

import SwiftUI

struct HomeView: View {

    @State private var selectedListView = true
    @State private var filterOn = false

    @State var disability = false
    @State var difficulty: Double = 0
    @State var distance: Double = 0

    var body: some View {
        NavigationStack {

            VStack {

                // Search bar with filter button
                
                HStack {
                    
                    TagAddedComponent(tagsToAddToActivity: .constant([]))
                        .frame(width: 280, height: 50)
                        .background(.chefHat)
                        .cornerRadius(90)

                    // filter button
                    Button {
                        filterOn.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 50)
                                .foregroundStyle(.chefHat)

                            Image(systemName: "line.3.horizontal.decrease")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundStyle(.capVerde)
                        }
                    }
                }

                if filterOn {
                    FilterComponent(
                        disability: $disability,
                        difficulty: $difficulty,
                        distance: $distance
                    )
                }

                // if [tags].isEmpty! {
                //                ScrollView(.horizontal) {
                //                    show selected tags
                //                }}

                // Double button to switch between list and map
                HStack {

                    // List button
                    Button {
                        selectedListView = true
                    } label: {
                        ZStack {
                            if selectedListView {  // List is selected
                                UnevenRoundedRectangle(
                                    cornerRadii: .init(
                                        topLeading: 30,
                                        bottomLeading: 30
                                    )
                                )
                                .frame(width: 160, height: 30)
                                .foregroundStyle(.capVerde)

                                Text("Liste")
                                    .customBody(bold: true, color: .chefHat)
                            } else {  // Map is selected
                                UnevenRoundedRectangle(
                                    cornerRadii: .init(
                                        topLeading: 30,
                                        bottomLeading: 30
                                    )
                                )
                                .frame(width: 160, height: 30)
                                .foregroundStyle(.chefHat)

                                Text("Liste")
                                    .customBody(bold: true, color: .capVerde)
                            }
                        }
                    }
                    .padding(.horizontal, -4)

                    // Map button
                    Button {
                        selectedListView = false
                    } label: {
                        ZStack {
                            if selectedListView {  // List is selected
                                UnevenRoundedRectangle(
                                    cornerRadii: .init(
                                        bottomTrailing: 30,
                                        topTrailing: 30
                                    )
                                )
                                .frame(width: 160, height: 30)
                                .foregroundStyle(.chefHat)

                                Text("Carte")
                                    .customBody(
                                        bold: true,
                                        color: .capVerde
                                    )
                            } else {  // Map is selected
                                UnevenRoundedRectangle(
                                    cornerRadii: .init(
                                        bottomTrailing: 30,
                                        topTrailing: 30
                                    )
                                )
                                .frame(width: 160, height: 30)
                                .foregroundStyle(.capVerde)

                                Text("Carte")
                                    .customBody(bold: true, color: .chefHat)
                            }

                        }
                    }
                    .padding(.horizontal, -4)

                }
                .padding()

                // Deal with the View's change
                if selectedListView {
                    // List is selected so show List View
                    ListHomeView(
                        disability: $disability,
                        difficulty: $difficulty,
                        distance: $distance
                    )
                } else {
                    // Map is selected so show Map View
                    MapHomeView(
                        disability: $disability,
                        difficulty: $difficulty,
                        distance: $distance
                    )
                }

            }
        }
    }
}

#Preview {
    HomeView()
}
