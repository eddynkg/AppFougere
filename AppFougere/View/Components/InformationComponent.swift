//
//  InformationComponent.swift
//  AppFougere
//
//  Created by Eddy Charles on 30/10/2025.
//

import SwiftUI

struct InformationComponent: View {
    var body: some View {
        HStack (spacing: 1){
            NavigationLink {
                ProfileView()
            } label: {
                Image("user11")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
            }
            .buttonStyle(.plain)
            
            VStack (spacing: 4){
                Text("Fanny, 43 ans")
                    .font(.title2)
                    .bold()
                HStack {
                    Image(systemName: "mappin.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.capVerde)
                    VStack {
                        Text("Le lubéron, France")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.capVerde)
                        Text("Randonnée de Bonnieux")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundStyle(.capVerde)
                    }
                }
                
            }
            Text("5")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.capVerde)
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.capVerde)
                
        }
    }
}

#Preview {
    NavigationStack {
        InformationComponent()
    }
}
