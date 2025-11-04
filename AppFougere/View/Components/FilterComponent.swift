//
//  FilterComponent.swift
//  AppFougere
//
//  Created by JulietteM on 27/10/2025.
//

import SwiftUI

/* To do list :
    - filters apply on the activities
 */

struct FilterComponent: View {

    @State var filterOn = false
    @Binding var disability: Bool
    @Binding var difficulty: Double
    @Binding var distance: Double

    var body: some View {

        //FIXME: filters
        VStack(alignment: .leading) {

            // distance slider
            VStack(alignment: .leading) {
                Text("Distance : \(Int(distance)) km")
                    .customBody(bold: false, color: .capVerde)

                Slider(value: $distance, in: 0...50, step: 5) {}
            }
            .padding(12)

            // Difficulty stepper
            Stepper(
                "Difficulté : \(Int(difficulty))",
                value: $difficulty,
                in: 0...5
            )
            .customBody(bold: false, color: .capVerde)
            .padding(12)

            // disable checkbox
            Button {
                disability.toggle()
            } label: {
                HStack(alignment: .center) {
                    Image(
                        systemName: disability ? "checkmark.app.fill" : "app"
                    )
                    .foregroundStyle(.capVerde)
                    .font(.title3.bold())
                    Text("Accès PMR")
                        .customBody(bold: false, color: .capVerde)
                }
            }
            .padding(12)

        }
        .frame(width: 345)
        .padding(8)
        .background(.chefHat)
        .cornerRadius(16)

    }
}

#Preview {
    FilterComponent(disability: .constant(true), difficulty: .constant(0), distance: .constant(0))
}
