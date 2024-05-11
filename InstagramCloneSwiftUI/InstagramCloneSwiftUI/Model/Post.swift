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
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?

    var didLike: Bool? = false
}

extension Post {
    static let mockPosts: [Post] = [
        .init(
            id: "BC0B7A87-B914-47AA-A4A5-E37294CF204D",
            ownerUid: "BC0B7A87-B914-47AA-A4A5-E37294CF236E",
            caption: "Batman",
            likes: 124,
            imageUrl: "batman-2",
            timestamp: Date(),
            user: User.mockUsers[0]
        ),
        .init(
            id: "832C4061-A929-4BC2-A5A7-B2603D72DLK9",
            ownerUid: "832C4061-A929-4BC2-A5A7-B2603D72D6B4",
            caption: "Wakanda Forever",
            likes: 104,
            imageUrl: "black-panther-1",
            timestamp: Date(),
            user: User.mockUsers[3]
        ),
        .init(
            id: "F8624FBC-076C-4619-9603-8812F03AF242",
            ownerUid: "F8624FBC-076C-4619-9603-8812F03AF637",
            caption: "Iron Man",
            likes: 12,
            imageUrl: "iron-man-1",
            timestamp: Date(),
            user: User.mockUsers[2]
        ),
        .init(
            id: "31E9E3BE-C5FD-4B6D-8556-32AE8C5F3P98",
            ownerUid: "31E9E3BE-C5FD-4B6D-8556-32AE8C5F3428",
            caption: "Venom is hungry. Time to eat",
            likes: 34,
            imageUrl: "venom-10",
            timestamp: Date(),
            user: User.mockUsers[1]
        ),
        .init(
            id: "31E9E3BE-C5FD-4B6D-8556-32AE8C5FYR67",
            ownerUid: "31E9E3BE-C5FD-4B6D-8556-32AE8C5F3428",
            caption: "Venom is hungry. Time to eat",
            likes: 34,
            imageUrl: "venom-1",
            timestamp: Date(),
            user: User.mockUsers[1]
        ),
        .init(
            id: "2DC3A410-C31E-486A-B802-06A53967AC02",
            ownerUid: "2DC3A410-C31E-486A-B802-06A53967AAB5",
            caption: "This is some test caption for now",
            likes: 76,
            imageUrl: "spiderman",
            timestamp: Date(),
            user: User.mockUsers[4]
        ),
    ]
}
