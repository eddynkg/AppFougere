//
//  AddActivityView.swift
//  AppFougere
//
//  Created by Basile Carle on 27/10/2025.
//

import SwiftUI
import SwiftData
import CoreLocation

struct AddActivityView: View {
 
    
    @Query var tagsOnActivity: [TagOnActivity] = []
    @State var name: String = ""
    @State var tagSearch: String = ""
    @State var activityDuration: CGFloat = 0
    @State var activityDifficulty: CGFloat = 0
    @State var activityDescription: String = ""
    
    
    
    var body: some View {
        ZStack {
            Color.capVerde.ignoresSafeArea()
            VStack {
                VStack {
                    // Titre
                    Text("Ajouter une activité")
                        .customTitle(color: .capVerde)
                    Divider()
                    
                    ScrollView{
                        
                        // Titre et Tag
                        HStack(spacing: 16) {
                            Text("Titre : ")
                                .frame(width: 60)
                                .customBody(bold: true, color: .capVerde)
                            TextField("Nom de l'activité", text: $name)
                                .foregroundStyle(Color.black)
                            Spacer()
                        }
                        
                        // Localisation de l'activité'
                        AddLocationComponent()

                        TagAddedComponent()
                        Divider()
                            .padding(.vertical)
                        
                        // Ajout photos
                        ActivityPhotoAddComponent()
                        // Description
                        Divider()
                        Text("Description : ")
                            .customBody(bold: true, color: .capVerde)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Décrivez votre activité : ")
                            .customBody(bold: false, color: .capVerde)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextEditor(text: $activityDescription)
                            .frame(height: 200)
                            .padding(8)
                            .scrollContentBackground(.hidden)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(.chefHat)
                            )
                        
                        
                        // Durée
                        Divider()
                        HStack {
                            Text("Durée : \(String(format: "%.1f", activityDuration))")
                                .customBody(bold: true, color: .capVerde)
                            Slider(
                                value: $activityDuration,
                                in: CGFloat(0)...CGFloat(24),
                                step: CGFloat(0.5)
                            )
                        }
                        // Difficulté
                        HStack {
                            
                            Stepper(
                                "Difficulté : \(String(format: "%.0f", activityDifficulty))",
                                value: $activityDifficulty,
                                in: 0...5
                            )
                            .customBody(bold: true, color: .capVerde)
                        }
                    }
                    
                    Spacer()
                }
                .padding(32)
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .frame(maxHeight: .infinity)
            .foregroundColor(.capVerde)
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(Color.white)
            )
            .padding()
        }.font(.custom("Inter", size: 18))


        
    }
}

#Preview {
    AddActivityView()
}
