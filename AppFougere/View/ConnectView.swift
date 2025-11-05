//
//  RegisterView.swift
//  AppFougere
//
//  Created by apprenant114 on 29/10/2025.
//

import SwiftUI

struct ConnectView: View {
    @EnvironmentObject var session: SessionManager
    @Binding var isLogin: Bool  // pour basculer vers l'inscription
    @AppStorage("isLoggedIn") private var isLoggedIn = false  // même clé que ContentView

    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

    var body: some View {
        VStack(spacing: 32) {
            Text("Connexion")
                .font(.largeTitle.bold())
                .foregroundStyle(.capVerde)

            CustomTextField(
                placeholder: "Identifiant",
                text: $username,
                systemImage: "person"
            )
            .textContentType(.username)
            .textInputAutocapitalization(.never)

            VStack {
                CustomSecureField(
                    placeholder: "Mot de passe",
                    text: $password,
                    showPassword: $showPassword,
                    regexOn: false
                )

                NavigationLink(
                    "Mot de passe oublié ?",
                    destination: ResetPswdView(isLogin: $isLogin)
                )
                .foregroundStyle(.capVerde)
                .font(.subheadline)
                .padding(.leading, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            Button("Connexion") {
                session.login(username: username)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.capVerde)
            .foregroundStyle(.chefHat)
            .cornerRadius(30)

            Button {
                isLogin = false  // bascule vers l’écran d’inscription
            } label: {
                VStack(spacing: 4) {
                    HStack(spacing: 0) {
                        Text("Pas encore de compte ? ")
                        Text("Inscription").bold()
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.capVerde)
                }
                .fixedSize()
            }
            .foregroundStyle(.capVerde)
        }.padding(.horizontal, 32)
    }
}

#Preview {
    ConnectView(isLogin: .constant(true))
        .environmentObject(SessionManager())
}
