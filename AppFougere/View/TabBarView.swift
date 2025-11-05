//
//  TabView.swift
//  AppFougere
//
//  Created by Eddy Charles on 28/10/2025.
//

import SwiftUI

enum AppTab: Hashable {
    case home
    case create
    case profile
    case admin
    case test
}

struct TabBarView: View {
    
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(AppTab.home)
                .tabItem {
                    Label("Accueil", systemImage: "house")
                }
            
            AddActivityView()
                .tag(AppTab.create)
                .tabItem {
                    Label("Créer", systemImage: "plus.circle")
                }
            PhotoTestView()
                .tag(AppTab.test)
                .tabItem {
                    Label("Photo Test", systemImage: "testtube.2")
                }
            ProfileView()
                .tag(AppTab.profile)
                .tabItem {
                    Label("Profil", systemImage: "person")
                }
        }
        .tint(.capVerde)
    }
}

#Preview {
    TabBarView()
}
