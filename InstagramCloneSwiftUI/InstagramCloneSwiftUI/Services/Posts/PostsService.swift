//
//  PostsService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import Foundation

enum PostError: Error {
    case postNotFound
}

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

    static func fetchPost(_ postId: String) async throws -> Post {
        guard let post = Post.mockPosts.filter({ $0.user?.id == postId}).first else { throw PostError.postNotFound }
        return post
    }
}
