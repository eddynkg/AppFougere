//
//  PhotoTestView.swift
//  AppFougere
//
//  Created by Basile Carle on 05/11/2025.
//

import SwiftUI
import PhotosUI
import SwiftData

struct PhotoTestView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var photos: [PhotoTest] = []
    @State var photosToAdd = [Data?]()
    @State var selectedPhotos = [PhotosPickerItem]()
    
    var body: some View {
        VStack {
            PhotosPicker(
                selection: $selectedPhotos,
                maxSelectionCount: 4,
                matching: .images) {
                    Text("Sélectionner une image")
                }
            
            VStack {
                ForEach(photosToAdd, id:\.self) { photoData in
                    if let data = photoData {
                        let uiImage = UIImage(data: data)
                        if let image = uiImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                        }
                        
                        HStack {
                            Button(
                                action: {
                                    deletePhoto()
                                }
                            ) {
                                Text("Supprimer")
                            }
                            Button(
                                action: {
                                    savePhoto(photoData: data)
                                }
                            ) {
                                Text("Sauvegarder")
                            }
                        }
                    }
                }
            }
            .onChange(of: selectedPhotos) {
                Task {
                    photosToAdd = []
                    for selectedPhoto in selectedPhotos {
                        if let selectedImage = try? await selectedPhoto.loadTransferable(
                            type: Data.self) {
                            photosToAdd.append(selectedImage)
                        }
                    }
                }
            }
        }
    }
    
    func savePhoto(photoData: Data?) {
        guard let photoToSave = photoData else { return }
        let tmpPhotoToSave = PhotoTest(
            title: "maPhoto",
            image: photoToSave
        )
        modelContext.insert(tmpPhotoToSave)
    }
    
    func deletePhoto() {
        
    }
}

#Preview {
    PhotoTestView()
}
