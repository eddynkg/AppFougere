//
//  AddLocationComponent.swift
//  AppFougere
//
//  Created by Basile Carle on 30/10/2025.
//

import SwiftUI

struct AddLocationComponent: View {
    var body: some View {
        Text("Localisation : ")
            .frame(maxWidth: .infinity, alignment: .leading)
            .customBody(bold: true, color: .capVerde)

    }
}

#Preview {
    AddLocationComponent()
}
