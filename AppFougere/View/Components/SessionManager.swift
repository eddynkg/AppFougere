//
//  SessionManager.swift
//  AppFougere
//
//  Created by apprenant114 on 05/11/2025.
//

import Combine
import Foundation

final class SessionManager: ObservableObject {
    // État de connexion
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(
        forKey: "isLoggedIn"
    )

    // Nom d'utilisateur
    @Published var username: String =
        UserDefaults.standard.string(forKey: "username") ?? ""

    // Connexion
    func login(username: String) {
        self.isLoggedIn = true
        self.username = username

        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        UserDefaults.standard.set(username, forKey: "username")
    }

    // Déconnexion
    func logout() {
        self.isLoggedIn = false
        self.username = ""

        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.removeObject(forKey: "username")
    }
}
