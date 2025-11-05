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
  
    @State var tagsToAdd: [Tag] = []
    
    @State var name: String = ""
    @State var tagSearch: String = ""
    @State var activityLocation: String = ""
    @State var activityHourDuration = 0
    @State var activityMinuteDuration = 0
    @State var activityDifficulty: CGFloat = 0
    @State var activityDescription: String = ""
    @State var activityIsPMRFriendly: Bool = false
    @State var isCarAccessible: Bool = false
    @State var isFootAccessible: Bool = false
    @State var isBikeAccessible: Bool = false
    @State var isPublicTransportationAccessible: Bool = false
    @State var activityPicturesToAddToActivity: [Data?] = []
    
    var userId = users.first!.id // Attention, à changer avec la bonne méthode

    
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {

        NavigationStack {
            ZStack {
                Color.capVerde.ignoresSafeArea()
                VStack {
                    VStack {
                        // Titre
                        VStack {
                            
                            Text("Ajouter une activité")
                                .customTitle(color: .capVerde)
                            Divider()
                        }
                        
                        ScrollView{
                            // Titre et Tag
                            VStack {
                                
                                VStack {
                                    HStack(spacing: 16) {
                                        Text("Titre : ")
                                            .frame(width: 60)
                                            .customBody(bold: true, color: .capVerde)
                                        TextField("Nom de l'activité", text: $name)
                                            .foregroundStyle(Color.black)
                                        Spacer()
                                    }
                                    
                                    
                                    
                                    TagAddedComponent(tagsToAddToActivity: $tagsToAdd)
                                    
                                        .padding(.vertical)
                                }
                            }
                            
                            
                            
                            // Difficulté.padding(.vertical)
                            VStack {
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
                                
                            }
                            
                            
                            // Durée
                            VStack {
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
                                        ForEach(0...59, id: \.self) {
                                            Text("\($0) m")
                                        }
                                    }
                                }
                                
                            }
                            
                            // Ajout photos
                            VStack {
                                Divider()
                                    .padding(.vertical)
                                ActivityPhotoAddComponent(
                                    selectedImages: $activityPicturesToAddToActivity
                                )
                                
                            }
                            
                            // Description
                            VStack {
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
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundColor(.chefHat)
                                    )
                                
                                
                            }
                            
                            
                            // Localisation de l'activité'
                            VStack {
                                Divider()
                                    .padding()
                                AddLocationComponent(activityLocation: $activityLocation)
                                
                            }
                            
                            
                            // PMR Friendly
                            
                            VStack {
                                Divider().padding(.top)
                                HStack {
                                    Toggle(isOn: $activityIsPMRFriendly, label: {
                                        Text("PMR Friendly : ")
                                            .customBody(bold: true, color: .capVerde)
                                    })
                                }
                                .padding(.vertical)
                                
                            }
                            
                            
                            
                            
                            // Accessibilité
                            VStack {
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
                            
                            
                            
                            
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                   
          
                            SaveButtonView(
                                selectedImages: activityPicturesToAddToActivity,
                                tagsToAdd: tagsToAdd,
                                name: name,
                                actDescription: activityDescription,
                                location: activityLocation,
                                difficulty: activityDifficulty,
                                handicap: activityIsPMRFriendly,
                                userId: userId,
                                accessibility: accessibilityArray(),
                                durationHour: activityHourDuration,
                                durationMin: activityMinuteDuration
                            )
               
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
    
    func accessibilityArray () -> [Accessibility] {
        let transports: [Bool] = [
            isCarAccessible, isBikeAccessible, isFootAccessible, isPublicTransportationAccessible
            ]
        var tmpArray: [Accessibility] = []
        for index in 0..<transports.count {
            switch index {
            case 0:
                if transports[index] == true {
                    tmpArray.append(.car)
                }
            case 1:
                if transports[index] == true {
                    tmpArray.append(.bike)
                }
            case 2:
                if transports[index] == true {
                    tmpArray.append(.foot)
                }
            case 3:
                if transports[index] == true {
                    tmpArray.append(.publicTransportation)
                }
            default:
                print("No case")
            }
        }
        return tmpArray
    }
}

#Preview {
    AddActivityView()
}
