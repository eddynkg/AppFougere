//
//  photoTestADetruire.swift
//  AppFougere
//
//  Created by Basile Carle on 05/11/2025.
//

import Foundation
import Swift
import SwiftData

@Model
class PhotoTest {
    var id: UUID = UUID()
    var title: String
    @Attribute(.externalStorage)
    var image: Data?
    
    init(title: String, image: Data?) {
        self.title = title
        self.image = image
    }
}
