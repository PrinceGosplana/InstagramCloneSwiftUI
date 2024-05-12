//
//  Comment.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 12.05.2024.
//

import Foundation

struct Comment: Identifiable, Codable {
    let id: String
    let postOwnerId: String
    let commentText: String
    let postId: String
    let date: Date
    let commentOwnerUid: String

    var user: User?
}

extension Comment {
    static let mockComment = Comment(
        id: "123",
        postOwnerId: "Test post owner",
        commentText: "Test comment for now",
        postId: "3214",
        date: Date(),
        commentOwnerUid: "BC0B7A87-B914-47AA-A4A5-E37294CF236E",
        user: nil
    )
}
