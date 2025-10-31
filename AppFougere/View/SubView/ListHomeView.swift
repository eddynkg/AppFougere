//
//  ListHomeView.swift
//  AppFougere
//
//  Created by JulietteM on 30/10/2025.
//

import SwiftUI

struct ListHomeView: View {

    var body: some View {

        ScrollView(.vertical) {

            ForEach(activityPictures) { activityPicture in

                NavigationLink {
                    DetailActivityView()
                } label: {

                    VStack(alignment: .leading) {
                        //FIXME: Image(activityPictures with activityId = activity.id) just one

                        Image(activityPicture.actContent)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 335, height: 335)
                            .cornerRadius(16)
                            .shadow(color: .blackKnight, radius: 4)

                        ForEach(activities) { activity in
                            if activityPicture.activityId == activity.id {
                                Text(activity.name)
                                    .customBody(bold: true, color: .chefHat)
                                    .padding(6)
                                    .background(.capVerde)
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical, 12)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ListHomeView()
}
