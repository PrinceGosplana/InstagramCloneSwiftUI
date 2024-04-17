//
//  Post.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Date
    let user: User?
}

extension Post {
    static let mockPosts: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Batman",
            likes: 124,
            imageUrl: "batman-2",
            timestamp: Date(),
            user: User.mockUsers[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Wakanda Forever",
            likes: 104,
            imageUrl: "black-panther-1",
            timestamp: Date(),
            user: User.mockUsers[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Iron Man",
            likes: 12,
            imageUrl: "iron-man-1",
            timestamp: Date(),
            user: User.mockUsers[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Venom is hungry. Time to eat",
            likes: 34,
            imageUrl: "venom-10",
            timestamp: Date(),
            user: User.mockUsers[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now",
            likes: 76,
            imageUrl: "venom-2",
            timestamp: Date(),
            user: User.mockUsers[4]
        ),
    ]
}
