//
//  UploadPostViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 18.04.2024.
//

import SwiftUI
import PhotosUI

actor UploadPostViewModel: ObservableObject {

    @MainActor @Published var selectedImage: PhotosPickerItem? {
         didSet { Task { await loadImage(fromItem: selectedImage) } }
    }

    @MainActor @Published var postImage: Image?

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }

        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        await MainActor.run {
            self.postImage = Image(uiImage: uiImage)
        }
    }
}
