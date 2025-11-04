//
//  ActDescriptionComponent.swift
//  AppFougere
//
//  Created by Eddy Charles on 31/10/2025.
//

import SwiftUI

struct ActDescriptionComponent: View {
    let activity: Activity
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("Description")
                    .font(.title2)
                    .foregroundStyle(.capVerde)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                Spacer()
            }
            Text(activity.actDescription)
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .background(
                    RoundedRectangle(cornerRadius: 20).fill(Color(.chefHat))
                )
                .padding(.horizontal, 16)


        }
    }
}

#Preview {
    ActDescriptionComponent(activity: Activity(
        name: "Exemple",
        actDescription: "Une rando incroyable dans le Luberon ! 😍 On se croirait dans un mini Colorado avec ces falaises ocres rouges et jaunes. Le contraste avec la végétation est fou. Une vraie claque visuelle, à faire absolument si vous êtes dans la région ! 🏜️✨",
        location: "Quelque part",
        difficulty: 2.0,
        handicap: false,
        userId: UUID(),
        accessibility: [.foot, .car],
        durationHour: 2,
        durationMin: 30
    ))
}
