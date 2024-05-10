//
//  PostsService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import Foundation

actor PostsService: PostsServiceProtocol {

    static let shared = PostsService()
    
    func fetchAllPosts() async throws -> [Post] {
        Post.mockPosts
    }
    
    func fetchUsersPosts(user: User) async throws -> [Post] {
        Post.mockPosts.filter({ $0.user?.id == user.id})
    }

    func uploadPost(user: User, post: Post) async throws {
        
    }
}
