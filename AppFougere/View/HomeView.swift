//
//  HomeView.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let session = SessionManager()
    session.login(username: "Eddy")
    return HomeView()
        .environmentObject(session)
}
