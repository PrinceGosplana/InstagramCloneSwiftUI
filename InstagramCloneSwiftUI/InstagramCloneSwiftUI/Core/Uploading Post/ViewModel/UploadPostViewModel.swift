//
//  UploadPostViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 18.04.2024.
//

import SwiftUI
import PhotosUI

final class UploadPostViewModel: ObservableObject {

    @Published var newPost: Post?

    @MainActor @Published var selectedImage: PhotosPickerItem? {
         didSet { Task { await loadImage(fromItem: selectedImage) } }
    }

    @MainActor @Published var postImage: Image?
    private var uiImage: UIImage?

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }

        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        await MainActor.run {
            self.postImage = Image(uiImage: uiImage)
        }
    }

    func uploadPost(from user: User?, caption: String) async throws {
        guard let user else { return }
        let post = Post(
            id: UUID().uuidString,
            ownerUid: user.id,
            caption: caption,
            likes: 0,
            imageUrl: Post.mockPosts[1].imageUrl,
            timestamp: Date(),
            user: user
        )
        await MainActor.run {
            newPost = post
        }
    }
}
