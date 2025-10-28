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
    
    func filterTagByActivity (activity: Activity, tags: [Tag], tagsOnActivity: [TagOnActivity]) -> [Tag] {
        let filteredResults = tagsOnActivity.filter { tagOnActivity in
            tagOnActivity.idActivity == activity.id
        }
        var tmpArray: [Tag] = []
        for filteredResult in filteredResults {
            let tmpResult = tags.filter { tag in
                tag.id == filteredResult.idTag
            }
            tmpArray.append(tmpResult[0])
        }
        return tmpArray
    }
    
    func addTagToActivity (activity: Activity, tags: [Tag]) -> [TagOnActivity] {
        var tmpArray : [TagOnActivity] = []
        for tag in tags {
            tmpArray.append(TagOnActivity(
                idTag: tag.id, idActivity: activity.id
            ))
        }
        return tmpArray
    }
    
}


@Model
class TagOnActivity {
    
    var id : UUID = UUID()
    var idTag: UUID
    var idActivity: UUID
    
    init(idTag: UUID, idActivity: UUID) {
        
        self.idTag = idTag
        self.idActivity = idActivity
    }
}
