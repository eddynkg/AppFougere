//
//  Tag.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import SwiftUI
import Observation

@Observable
class Tag {
    
    var id : UUID = UUID()
    var title: String
    
    init(id: UUID, title: String) {
        self.id = id
        self.title = title
    }
    
}

class TagOnActivity {
    
    var id : UUID = UUID()
    var idTag: UUID
    var idActivity: UUID
    
    init(id: UUID, idTag: UUID, idActivity: UUID) {
        self.id = id
        self.idTag = idTag
        self.idActivity = idActivity
    }
}
