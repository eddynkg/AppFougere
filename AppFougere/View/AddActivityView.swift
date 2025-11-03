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
    @State var activityHourDuration = 0
    @State var activityMinuteDuration = 0
    @State var activityDifficulty: CGFloat = 0
    @State var activityDescription: String = ""
    @State var activityIsPMRFriendly: Bool = false
    @State var isCarAccessible: Bool = false
    @State var isFootAccessible: Bool = false
    @State var isBikeAccessible: Bool = false
    @State var isPublicTransportationAccessible: Bool = false

    
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
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
                        
                        TagAddedComponent()
        
                            .padding(.vertical)
                        
                       
                        // Difficulté.padding(.vertical)
                        Divider().padding(.bottom)
                        HStack {
                            Text("Difficulté : ")
                                .customBody(bold: true, color: .capVerde)
                            Spacer()
                            Text("\(String(format: "%.0f", activityDifficulty))")
                                .customBody(bold: true, color: .capVerde)
                        }
                        Stepper(
                            "Décrivez le niveau  / 5 ",
                            value: $activityDifficulty,
                            in: 0...5
                        )
                        
                        // Durée
                        Divider().padding(.top)
                        HStack {
                            Text("Durée : ")
                                .customBody(bold: true, color: .capVerde)
                            
                            Spacer()
                            Picker("Heures", selection: $activityHourDuration) {
                                ForEach(0...24, id: \.self) {
                                    Text("\($0) h")
                                }
                            }
                            Picker("Minutes", selection: $activityMinuteDuration) {
                                ForEach(0...24, id: \.self) {
                                    Text("\($0) m")
                                }
                            }
                        }
                        
                        // Ajout photos
                        Divider()
                            .padding(.vertical)
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
                        

                        
                        // Localisation de l'activité'
                        Divider()
                            .padding()
                        AddLocationComponent()


                        

                        

                        
 

                        // PMR Friendly
                        Divider().padding(.top)
                        HStack {
                            Toggle(isOn: $activityIsPMRFriendly, label: {
                                Text("PMR Friendly : ")
                                    .customBody(bold: true, color: .capVerde)
                            })
                        }
                        .padding(.vertical)

                       
                        
                        
                        // Accessibilité
                        Divider()
                            .padding(.vertical)
                        HStack {
                            Text("Moyens d'accès : ")
                                .customBody(bold: true, color: .capVerde)
                            Spacer()
                        }
                        LazyVGrid(columns: columns, spacing: 16) {
                            TransportationMeansComponent(
                                toggleIsOn: $isCarAccessible,
                                imageName: "car.circle"
                            )
                            TransportationMeansComponent(
                                toggleIsOn: $isFootAccessible,
                                imageName: "figure.walk"
                            )
                            TransportationMeansComponent(
                                toggleIsOn: $isBikeAccessible,
                                imageName: "bicycle.circle"
                            )
                            TransportationMeansComponent(
                                toggleIsOn: $isPublicTransportationAccessible,
                                imageName: "tram"
                            )
                            
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
