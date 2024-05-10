//
//  PostsServiceProtocol.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import Foundation

protocol PostsServiceProtocol {
    func fetchAllPosts() async throws -> [Post]
    func fetchUsersPosts(user: User) async throws -> [Post]
    func uploadPost(user: User, post: Post) async throws
}
