//
//  User.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class User: Identifiable {
    var id: UUID = UUID()
    var userName: String
    var email: String
    var password: String //gérer le système de passwd
    var bio: String?
    var profilePicture: String?
    var verifCode: String? // to verify user after forgotten password
    var codeDate: String?  // to limit in time verifCode
    
    init(userName: String, email: String, password: String, bio: String? = nil, profilePicture: String? = nil, verifCode: String? = nil, codeDate: String? = nil) {
        self.userName = userName
        self.email = email
        self.password = password
        self.bio = bio
        self.profilePicture = profilePicture
        self.verifCode = verifCode
        self.codeDate = codeDate
    }
}

