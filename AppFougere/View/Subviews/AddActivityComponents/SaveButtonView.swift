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
    
    var selectedImages: [Data?]
    
    var tagViewModel = TagViewModel()
    
    var tagsToAdd: [Tag]
    
    var activity: Activity
    
    @State private var navigate = false
        
    var body: some View {
        
        NavigationStack {
            VStack{
                
                Button(
                    action: {
                        
                        insertActivity(activity: activity)
                        linkTagsToActivity(activity: activity, tags: tagsToAdd)
                        saveActivityPicture(
                            activityId: activity.id,
                            actContent: "\(activity.name)",
                            date: Date(),
                            images: selectedImages
                        )
                        navigate = true
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
                .padding()
            }
            .navigationDestination(
                isPresented: $navigate
            ) {
                DetailActivityView(activity: activity, isSwiftData: true)
            }
            
            
        }
        
    }
        
    
    
    
    func insertActivity(activity: Activity)  {
        
        modelContext.insert(activity)
        
        
    }
    
    func linkTagsToActivity(activity: Activity, tags: [Tag]) {
        var tmpTagsOnActivity = tagViewModel.addTagToActivity(activity: activity, tags: tags)
        for tagOnActivity in tmpTagsOnActivity {
            let tagToInsert: TagOnActivity = tagOnActivity
            print(tagToInsert)
            modelContext.insert(tagToInsert)
        }
    }
    
    func saveActivityPicture(activityId: UUID, actContent: String, date: Date, images: [Data?]) {
        for image in images {
            let ActivityPictureToInsert = ActivityPicture(
                activityId: activityId,
                actContent: actContent,
                date: date,
                image: image
            )
            modelContext.insert(ActivityPictureToInsert)
            
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


