//
//  ProfileViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import Foundation

protocol ProfileFollowProtocol: AnyObject {
    func follow()
    func unfollow()
    func checkIfUserIsFollow()
}

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var posts = [Post]()

    init(user: User) {
        self.user = user
        Task { await fetchUserPosts() }
        Task { await fetchUserStats() }
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

    func fetchUserStats() async {
        do {
            user.stats = try await UserService.fetchUserStats(uid: user.id)
        } catch {
            print("Error while fetching user's stats \(error.localizedDescription)")
        }
    }
}

// MARK: - Following

extension ProfileViewModel: ProfileFollowProtocol {
    func follow() {
        Task {
            try await UserService.follow(uid: user.id)
            user.isFollowed = true
        }
    }
    
    func unfollow() {
        Task {
            try await UserService.unfollow(uid: user.id)
            user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollow() {
        Task {
            user.isFollowed = try await UserService.checkIfUserfollow(uid: user.id)
        }
    }
}
