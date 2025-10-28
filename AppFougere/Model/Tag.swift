//
//  Tag.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import Foundation
import SwiftUI
import Observation
import SwiftData


@Model
class Tag: Identifiable {
    
    var id : UUID = UUID()
    var title: String
    var isVisible: Bool = true
    
    func closeTagDisplay () {
        isVisible = false
    }
    

    
    
    init(title: String) {
        self.title = title
    }
    
}

class TagViewModel {

    
    func filterExistingTags (tags: [Tag], searchText: String) -> [Tag] {
        if searchText == "" {
            return tags
        } else {
            
            let filteredTags = tags.filter { tag in
                tag.title.contains(searchText)
            }
            return filteredTags
        }
            
    }
    
}


@Model
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
