//
//  PostManager.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import Foundation

final class PostManager: ObservableObject {

    private let service: PostsServiceProtocol
    @MainActor @Published var posts: [Post] = []

    init(service: PostsServiceProtocol)  {
        self.service = service
        Task { await fetchAllPosts() }
    }

    @MainActor
    func fetchAllPosts() async {
        do {
            posts = try await service.fetchAllPosts()
        } catch {
            print("Fetching posts error \(error)")
        }
    }

    @MainActor
    func uploadPost(_ post: Post) async {
        posts.append(post)
    }
}
