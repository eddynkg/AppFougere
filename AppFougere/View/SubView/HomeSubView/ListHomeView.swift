//
//  ListHomeView.swift
//  AppFougere
//
//  Created by JulietteM on 30/10/2025.
//

import SwiftUI

struct ListHomeView: View {

    // garde la photo la plus récente
    private var uniqueLatestPictures: [ActivityPicture] {
        // Regrouper par activityId
        let grouped = Dictionary(grouping: activityPictures, by: { $0.activityId })
        // Prendre la plus récente de chaque groupe
        return grouped.values.compactMap { pics in
            pics.max(by: { $0.date < $1.date })
        }
        // Optionnel: trier par date décroissante pour l’affichage
        .sorted(by: { $0.date > $1.date })
    }

    var body: some View {

        ScrollView(.vertical) {

            ForEach(uniqueLatestPictures) { activityPicture in

                // Trouver l'activité correspondante
                if let activity = activities.first(where: { $0.id == activityPicture.activityId }) {

                    NavigationLink {
                        DetailActivityView(activity: activity)
                    } label: {
                        VStack(alignment: .leading) {
                            // Image principale (depuis la photo)
                            Image(activityPicture.actContent)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 335, height: 335)
                                .cornerRadius(16)
                                .shadow(color: .blackKnight, radius: 4)

                            // Nom de l’activité
                            Text(activity.name)
                                .customBody(bold: true, color: .chefHat)
                                .padding(6)
                                .background(.capVerde)
                                .cornerRadius(12)
                                .padding(.horizontal)
                        }
                        .padding(.vertical, 12)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    NavigationStack {
        ListHomeView()
    }
}
