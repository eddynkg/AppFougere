//
//  AddActivityView.swift
//  AppFougere
//
//  Created by Eddy Charles on 27/10/2025.
//

import SwiftUI

struct AddActivityView: View {
    @State var name: String = ""
    
    
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                VStack {
                    
                    Divider()
                    HStack(spacing: 16) {
                        Text("Titre : ")
                            .font(.headline)
                            .fontWeight(.bold)
                        TextField("Nom de l'activité", text: $name)
                            .foregroundStyle(Color.black)
                    }
                    
                    Spacer()
                }
                .padding()
                
            }
            .frame(maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color.white)
            )
            .padding()
        }

        
    }
}

#Preview {
    AddActivityView()
}
