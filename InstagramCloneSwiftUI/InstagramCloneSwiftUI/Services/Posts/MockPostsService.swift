//
//  MockPostsService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import Foundation

actor MockPostsService: PostsServiceProtocol {
    
    @Published var posts = Post.mockPosts

    func fetchAllPosts() async throws -> [Post] {
        posts
    }

    func fetchUsersPosts(user: User) async throws -> [Post] {
        posts.filter({ $0.user?.id == user.id})
    }

    func uploadPost(user: User, post: Post) async throws {
        posts.append(post)
    }
}
