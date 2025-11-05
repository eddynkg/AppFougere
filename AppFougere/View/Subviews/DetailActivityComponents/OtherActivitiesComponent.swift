//
//  OtherActivitiesComponent.swift
//  AppFougere
//
//  Created by Eddy Charles on 31/10/2025.
//

import SwiftUI

struct OtherActivitiesComponent: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("Activités aux alentours")
                    .font(.title2)
                    .foregroundStyle(.capVerde)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                Spacer()
            }
            ScrollView(.horizontal) {
                HStack{
                    ZStack(alignment: .topLeading){
                        Image("rando")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 2)
                        Text("Randonnée")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                Capsule().fill(.capVerde)
                            )
                            .padding([.top, .leading], 10)
                    }
                    ZStack(alignment: .topLeading){
                        Image("bivouac")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 2)
                        Text("Bivouac")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                Capsule().fill(.capVerde)
                            )
                            .padding([.top, .leading], 10)
                    }
                    ZStack(alignment: .topLeading){
                        Image("baignade")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 2)
                        Text("Baignade")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                Capsule().fill(.capVerde)
                            )
                            .padding([.top, .leading], 10)
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    OtherActivitiesComponent()
}
