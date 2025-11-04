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


enum TagDisplayMode {
    case addToActivity, removeFromActivity, tagCreation, tagDisplay
    
    /*
     addToActivity : on affiche un tag pour proposer de l'ajouter à une activité
     removeFromActivity : une fois le tag ajouté, on peut le désassocier de l'activité
     tagCreation : on ajoute ou supprime un tag du contexte
     tagDisplay : on ne fait qu'afficher un tag
     */
}



@Model
class Tag: Identifiable {
    
    var id : UUID = UUID()
    var title: String

    
    init(title: String) {
        self.title = title
    }
    
}

class TagViewModel {

    
    func isTagExisting(searchText: String, tags: [Tag]) -> Bool {
        let filteredResult = tags.filter { tag in
            tag.title.lowercased() == searchText.lowercased()
        }
        if filteredResult == [] {
            return false
        } else {
            return true
        }
    }
    
    func filterExistingTags (tags: [Tag], searchText: String) -> [Tag?] {
        if searchText == "" {
            return []
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
class TagOnActivity: Identifiable {
    
    var id : UUID = UUID()
    var idTag: UUID
    var idActivity: UUID
    
    init(idTag: UUID, idActivity: UUID) {
        
        self.idTag = idTag
        self.idActivity = idActivity
    }
}

class TagOnActivityViewModel {
    // Retourne les tags associés à une activité, en utilisant les tableaux globaux `tags` et `tagsOnActivity`.
    func tagsForActivity(_ activity: Activity) -> [Tag] {
        // Filtrer les liaisons pour cette activité
        let linksForActivity: [TagOnActivity] = tagsOnActivity.filter { link in
            return link.idActivity == activity.id
        }

        // Associer chaque lien au Tag correspondant
        var results: [Tag] = []
        for link in linksForActivity {
            if let matched = tags.first(where: { tag in
                return tag.id == link.idTag
            }) {
                results.append(matched)
            }
        }

        return results
    }
}
