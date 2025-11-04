//
//  ListHomeView.swift
//  AppFougere
//
//  Created by JulietteM on 30/10/2025.
//

import SwiftUI

struct ListHomeView: View {

    @Binding var disability: Bool
    @Binding var difficulty: Double
    @Binding var distance: Double

    var filteredActivities: [Activity] {
        var result = activities

        if difficulty >= 1 {
            result = result.filter { $0.difficulty <= difficulty }
        }

        if disability {
            result = result.filter { $0.handicap == true }
        }

//        if distance > 0 {
//            result = result.filter {$0}
//        }

        return result

    }

    var body: some View {

        ScrollView(.vertical) {

            ForEach(activityPictures) { activityPicture in

                NavigationLink {
                    // DetailActivityView()
                } label: {

                    // if picture have the same activityId of a past picture -> ignore picture

                    // search the activity's name attach to the picture
                    ForEach(filteredActivities) { activity in

                        if activityPicture.activityId == activity.id {
                            VStack(alignment: .leading) {
                                // Show picture of activity
                                Image(activityPicture.actContent)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 335, height: 335)
                                    .cornerRadius(16)
                                    .shadow(color: .blackKnight, radius: 4)
                                // show activity's name
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

                    .frame(width: 350)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ListHomeView(
        disability: .constant(true),
        difficulty: .constant(2),
        distance: .constant(50)
    )
}
