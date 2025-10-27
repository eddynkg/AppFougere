//
//  User.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable
class User {
    var id: UUID = UUID()
    var userName: String
    var email: String
    var password: String //gérer le système de passwd
    var bio : String?
    var profilePicture: Image?
    
    init(id: UUID, userName: String, email: String, password: String, bio: String? = nil, profilePicture: Image? = nil) {
        self.id = id
        self.userName = userName
        self.email = email
        self.password = password
        self.bio = bio
        self.profilePicture = profilePicture
    }
}
