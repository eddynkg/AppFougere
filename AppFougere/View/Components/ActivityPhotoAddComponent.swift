//
//  ActivityPhotoAddComponent.swift
//  AppFougere
//
//  Created by Basile Carle on 29/10/2025.
//

import SwiftUI
import PhotosUI

struct ActivityPhotoAddComponent: View {
    
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    var columns = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150))
    ]
    
    var body: some View {
        VStack {
            Text("Ajout photos :")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
                .fontWeight(.bold)

            VStack {

                
                ScrollView {
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0..<selectedImages.count, id: \.self) { i in
                            selectedImages[i]
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                        PhotosPicker(selection: $pickerItems, maxSelectionCount: 4, matching: .images) {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 150, height: 150)
                                    .foregroundStyle(Color.chefHat)
                                Image(systemName: "plus.square")
                            }
                        }
                                
                       
                        
                    }
                }
                
            }
            .onChange(of: pickerItems) {
                Task {
                    selectedImages.removeAll()
                    for item in pickerItems {
                        if let loadedImage = try await item.loadTransferable(type: Image.self) {
                            selectedImages.append(loadedImage)
                        }
                    }
                    
                }
                
            }
        }
        .padding()
        .foregroundColor(.capVerde)
    }
}

#Preview {
    ActivityPhotoAddComponent()
}
