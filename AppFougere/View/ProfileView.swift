//
//  ProfileView.swift
//  AppFougere
//
//  Created by JulietteM on 27/10/2025.
//

import SwiftUI

struct ProfileView: View {
    
    var favoriteActivity: Activity? {
        // Save only this user favorites
        let userFavorites = favorites.filter {
            $0.userId == users[0].id
        }

        var favoritesActivities: [Activity] = []
        // Save only the activities matching with this user favorites and append in temporary array
        for favorite in userFavorites {
            favoritesActivities = activities.filter {
                $0.id == favorite.activityId
            }
        }
        //return only the first user's favorite activity
        return favoritesActivities.first
    }

    var body: some View {

        NavigationStack {
            VStack {
                

                HStack {
                    if let picture = users[0].profilePicture {
                        Image(picture)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .clipShape(Circle())
                    } else {
                        ZStack {
                            Circle()
                                .frame(width: 120)
                                .foregroundStyle(.capVerde)

                            Image(systemName: "person.fill")
                                .customText(
                                    bold: false,
                                    fontSize: 56,
                                    color: .chefHat
                                )
                        }
                        .padding(8)
                    }

                    Text(users[0].userName)
                        .customTitle(color: .blackKnight)
                        .padding(.leading, 8)
                    
                    VStack {
                        

                        NavigationLink {
                            AdminView()
                        } label: {
                            Image(systemName: "gearshape")
                                .font(.title)
                                .foregroundStyle(.capVerde)
                                .padding(.horizontal)
                        }
                        Spacer()
                            .frame(height: 100)
                    }
                }
                .padding(.top)
                .padding(.bottom, 4)
                

                ScrollView(.vertical) {
                    
                    // Bio appear if isn't nil
                    if let bio = users[0].bio {
                        Text(bio)
                            .customBody(bold: false, color: .blackKnight)
                            .frame(width: 337)
                            .padding(8)
                            .background(.chefHat)
                            .cornerRadius(24)
                            .padding(8)
                    }
                    
                    //FIXME: My activities title link to a view showing all the activities created by the user
                    HStack(alignment: .center) {
                        
                        NavigationLink {
                            // createdActivitiesView()
                        } label: {
                            Text("Mes activités")
                                .customSubtitle(
                                    bold: false,
                                    color: .blackKnight
                                )

                            Image(systemName: "chevron.right")
                                .font(.title.bold())
                                .foregroundStyle(.capVerde)
                        }
                        .padding(.horizontal, 8)
                        Spacer()
                    }
                    .padding(.horizontal)

                    // Save the first activity created by user
                    let userActivity = activities.filter {
                        $0.userId == users[0].id
                    }.first
                    
                    if let userActivity {
                        
                        // Show a picture and the name of the activity created by user
                        ScrollView(.horizontal) {
                                HStack {
                                    ForEach(activityPictures) { activityPicture in

                                            if userActivity.id == activityPicture.activityId
                                            {

                                                NavigationLink {

                                                    DetailActivityView(
                                                        activity: userActivity
                                                    )
                                                } label: {

                                                    VStack(alignment: .leading) {
                                                        // Show picture of activity
                                                        Image(
                                                            activityPicture.actContent
                                                        )
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 335, height: 335)
                                                        .cornerRadius(16)

                                                        // show activity's name
                                                        Text(userActivity.name)
                                                            .customBody(
                                                                bold: false,
                                                                color: .chefHat
                                                            )
                                                            .padding(6)
                                                            .background(.capVerde)
                                                            .cornerRadius(12)
                                                    }
                                                    .padding(.horizontal)
                                                }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        .scrollIndicators(.hidden)
                        .padding(.bottom, 12)
                        }

                    //FIXME: My favorites title link to a view showing all the favorites
                    HStack(alignment: .center) {

                        NavigationLink {
                            // favoriteActivitiesView()
                        } label: {
                            Text("Mes favoris")
                                .customSubtitle(
                                    bold: false,
                                    color: .blackKnight
                                )

                            Image(systemName: "chevron.right")
                                .font(.title.bold())
                                .foregroundStyle(.capVerde)
                        }
                        .padding(.horizontal, 8)
                        Spacer()
                    }
                    .padding(.horizontal)

                    // Favorites preview
                    if let favoriteActivity {
                        ForEach(activityPictures) { activityPicture in

                            if favoriteActivity.id
                                == activityPicture.activityId

                            {

                                NavigationLink {

                                    DetailActivityView(
                                        activity: favoriteActivity
                                    )
                                } label: {

                                    VStack(alignment: .leading) {

                                        // Show picture of activity
                                        Image(
                                            activityPicture
                                                .actContent
                                        )
                                        .resizable()
                                        .scaledToFill()
                                        .frame(
                                            width: 335,
                                            height: 335
                                        )
                                        .cornerRadius(16)

                                        // show activity's name
                                        Text(favoriteActivity.name)
                                            .customBody(
                                                bold: false,
                                                color: .chefHat
                                            )
                                            .padding(6)
                                            .background(.capVerde)
                                            .cornerRadius(12)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }

                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    ProfileView()
}
