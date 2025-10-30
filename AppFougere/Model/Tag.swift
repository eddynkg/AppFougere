//
//  Tag.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Tag: Identifiable {
    
    var id : UUID = UUID()
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
}

class TagOnActivity: Identifiable {
    
    var id : UUID = UUID()
    var idTag: UUID
    var idActivity: UUID
    
    init(idTag: UUID, idActivity: UUID) {
        self.idTag = idTag
        self.idActivity = idActivity
    }
}
