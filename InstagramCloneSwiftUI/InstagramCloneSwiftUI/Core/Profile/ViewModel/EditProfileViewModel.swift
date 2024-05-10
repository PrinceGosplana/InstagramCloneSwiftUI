//
//  EditProfileViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 19.04.2024.
//

import PhotosUI
import SwiftUI
//import Firebase

@MainActor
final class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage)}}
    }

    @Published var profileImage: Image?
    @Published var fullName = ""
    @Published var bio = ""

    private var uiImage: UIImage?

    init(user: User) {
        self.user = user

        if let fullName = user.fullName {
            self.fullName = fullName
        }

        if let bio = user.bio {
            self.bio = bio
        }
    }

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }

        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        profileImage = Image(uiImage: uiImage)
    }

    func updateUserData() async throws {

        var data = [String: Any]()

        if let uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }

        if !fullName.isEmpty && user.fullName != fullName {
            data["fullName"] = fullName
        }

        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }

//        if !data.isEmpty {
//            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
//        }
    }
}
