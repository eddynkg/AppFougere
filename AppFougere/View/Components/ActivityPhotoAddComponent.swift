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
    @Binding var selectedImages: [Data?]
    
    
    var columns = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150))
    ]
    
    var body: some View {
        VStack {
            Text("Ajout photos :")
                .frame(maxWidth: .infinity, alignment: .leading)
                .customBody(bold: true, color: .capVerde)

            VStack {

                
               
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(selectedImages, id: \.self) { selectedImage in
                            if let imageData = selectedImage {
                                let imageToDisplay = UIImage(data: imageData)
                                if let image = imageToDisplay {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 150)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                }
                            }
                            
                        }
                        
                        PhotosPicker(selection: $pickerItems, maxSelectionCount: 4, matching: .images) {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 150, height: 150)
                                    .foregroundStyle(Color.chefHat)
                                Image(systemName: "plus.square")
                            }
                        }
                                
                       
                        
                    }
                
                
            }
            .onChange(of: pickerItems) {
                Task {
                    selectedImages.removeAll()
                    for item in pickerItems {
                        if let loadedImage = try await item.loadTransferable(type: Data.self) {
                            selectedImages.append(loadedImage)
                        }
                    }
                    
                }
                
            }
        }
//        .padding()
        .foregroundColor(.capVerde)
    }
}

#Preview {
    ActivityPhotoAddComponent(selectedImages: .constant([nil]))
}
