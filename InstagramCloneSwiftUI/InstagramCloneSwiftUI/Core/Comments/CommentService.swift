//
//  CommentService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 12.05.2024.
//

import Foundation

actor CommentService: CommentServiceProtocol {

    let postId: String

    init(postId: String) {
        self.postId = postId
    }
    
    func uploadComment(_ comment: Comment) async throws {

    }

    func fetchComments() async throws -> [Comment] {
        [Comment.mockComment].sorted { $0.date > $1.date }
    }
}
