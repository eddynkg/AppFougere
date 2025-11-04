//
//  RatingActComponent.swift
//  AppFougere
//
//  Created by Eddy Charles on 03/11/2025.
//

import SwiftUI

struct RatingActComponent: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("Évaluation")
                    .font(.title2)
                    .foregroundStyle(.capVerde)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                Spacer()
            }
        }
    }
}

#Preview {
    RatingActComponent()
}
