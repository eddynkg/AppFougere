//
//  AddActivityView.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import SwiftUI

struct AddActivityView: View {
    @State var name: String = ""
    @State var tagSearch: String = ""
    @State var activityDuration: CGFloat = 0
    @State var isEditing: Bool = false
    
    
    
    var body: some View {
        ZStack {
            Color.capVerde.ignoresSafeArea()
            VStack {
                VStack {
                    Text("Ajouter une activité")
                        .font(.title)
                        .fontWeight(.bold)

                    Divider()
                    HStack(spacing: 16) {
                        Text("Titre : ")
                            .frame(width: 50)
                            .font(.headline)
                            .fontWeight(.bold)
                        TextField("Nom de l'activité", text: $name)
                            .foregroundStyle(Color.black)
                        Spacer()
                    }
                    TagAddedComponent()
                    Divider()
                        .padding(.vertical)
                    ActivityPhotoAddComponent()
                    
                    // Durée
                    HStack {
                        Text("Durée : \(String(format: "%.1f", activityDuration))")
                        Slider(
                            value: $activityDuration,
                            in: CGFloat(0)...CGFloat(24),
                        )
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
