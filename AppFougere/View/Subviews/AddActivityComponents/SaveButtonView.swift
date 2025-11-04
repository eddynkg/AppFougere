//
//  SaveButtonView.swift
//  AppFougere
//
//  Created by Basile Carle on 03/11/2025.
//

import SwiftUI
import SwiftData

struct SaveButtonView: View {
    @Environment(\.modelContext) var modelContext
    @Query var tagsOnActivity: [TagOnActivity] = []
    @Query var activitiesSD: [Activity] = []
    var tagViewModel = TagViewModel()
    
    var tagsToAdd: [Tag]
    
    
    var name: String?
    var actDescription: String?
    var location: String?
    var difficulty: Double?
    var handicap: Bool?
    var userId: UUID?
    var accessibility: [Accessibility]?
    var durationHour: Int?
    var durationMin: Int?
    
    var body: some View {
        Button(
            action: {
                insertActivity()
                
            }
        ) {
            Text("Enregistrer")
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color.capVerde)
                )
        }
        .padding()    }
    
    func insertActivity() {
        let activityToInsert = Activity(
            name: name!,
            actDescription: actDescription!,
            location: location!, // gérer l'insertion
            difficulty: difficulty!,
            handicap: handicap!,
            userId: userId!, // récupérer le userId
            accessibility: accessibility!, // transformer les réglage en un tableau d'enum
            durationHour: durationHour!,
            durationMin: durationMin!
        )
        modelContext.insert(activityToInsert)
        linkTagsToActivity(activity: activityToInsert, tags: tagsToAdd)
        
    }
    
    func linkTagsToActivity(activity: Activity, tags: [Tag]) {
        var tmpTagsOnActivity = tagViewModel.addTagToActivity(activity: activity, tags: tags)
        for tagOnActivity in tmpTagsOnActivity {
            let tagToInsert: TagOnActivity = tagOnActivity
            print(tagToInsert)
            modelContext.insert(tagToInsert)
        }
        
    }
    
    /*
     Création de la logique d'enregistrement dans swiftData
     
     Il faut créer une entrée dans
     - Activity
     - TagOnActivity
     - ActivityPicture
     
     Il faut récupérer l'UUID de l'utilisateur courant
     
     
     
     */
}


