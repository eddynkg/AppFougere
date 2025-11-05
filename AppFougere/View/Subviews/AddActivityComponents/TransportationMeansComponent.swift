//
//  TransportationMeansComponent.swift
//  AppFougere
//
//  Created by Basile Carle on 03/11/2025.
//

import SwiftUI

struct TransportationMeansComponent: View {
    @Binding var toggleIsOn: Bool
    var imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .font(Font.system(size: 24))
                
            Toggle(isOn: $toggleIsOn) {
                Text("")
            }
        }
        .padding(.leading, 16)
    }
}

#Preview {
    @Previewable   @State var isOn: Bool = false
    
    TransportationMeansComponent(toggleIsOn: $isOn, imageName: "car.circle")
}
