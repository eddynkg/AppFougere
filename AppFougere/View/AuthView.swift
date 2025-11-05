//
//  AuthView.swift
//  AppFougere
//
//  Created by apprenant114 on 30/10/2025.
//

import SwiftUI

struct AuthView: View {
    @State private var isLogin = true

    var body: some View {
        NavigationStack {
            if isLogin {
                ConnectView(isLogin: $isLogin)
            } else {
                RegisterView(isLogin: $isLogin)
            }
        }
    }
}


// MARK: - Aperçu
#Preview {
    AuthView()
        .environmentObject(SessionManager())
}
