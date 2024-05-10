//
//  ProfileViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var posts = [Post]()

    init(user: User) {
        self.user = user
        Task { await fetchUserPosts() }
    }

    func fetchUserPosts() async {
        do {
            let posts = try await PostsService.shared.fetchUsersPosts(user: user)
            await MainActor.run {
                self.posts = posts
            }
        } catch {
            print("Error while fetching user's posts \(error.localizedDescription)")
        }
    }
}
