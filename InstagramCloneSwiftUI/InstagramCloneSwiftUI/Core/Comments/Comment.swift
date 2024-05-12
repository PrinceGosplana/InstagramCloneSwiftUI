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
