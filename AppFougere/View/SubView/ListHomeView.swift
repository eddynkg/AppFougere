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
            
//            VStack(alignment: .leading) {
                
                ForEach(activities) { activity in
                    VStack(alignment: .leading) {
                        // Image(activityPictures with activityId = activity)
                        
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 335, height: 335)
                            .foregroundStyle(.gray.opacity(0.3))
                        
                        Text(activity.name)
                            .customBody(bold: false, color: .blackKnight)
                            .padding(6)
                            .background(.chefHat)
                            .cornerRadius(12)
                            .padding(.horizontal)
                            
//                            .frame(width: 335)
                    }
                    .padding(.vertical, 12)
                }
//            }
        }
    }
}

#Preview {
    ListHomeView()
}
