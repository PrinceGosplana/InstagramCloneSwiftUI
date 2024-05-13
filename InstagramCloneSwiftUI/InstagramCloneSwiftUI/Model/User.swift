//
//  User.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import Foundation
//import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    var userName: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    var email: String
    var isFollowed: Bool? = false
    var stats: UserStats?
}

struct UserStats: Codable, Hashable {
    var followingCount: Int
    var followersCount: Int
    var postsCount: Int
}

extension User {
    static let mockUsers: [User] = [
        .init(
            id: "BC0B7A87-B914-47AA-A4A5-E37294CF236E",
            userName: "Batman",
            profileImageUrl: "batman-2",
            fullName: "Bruce Wayne",
            bio: "Gotham's Dark Knight",
            email: "batman@gmail.com",
            stats: UserStats(
                followingCount: 1,
                followersCount: 1,
                postsCount: 1
            )
        ),
        .init(
            id: "31E9E3BE-C5FD-4B6D-8556-32AE8C5F3428",
            userName: "Venom",
            profileImageUrl: "venom-2",
            fullName: "Eddie Brock",
            bio: "Venom",
            email: "venom@gmail.com",
            stats: UserStats(
                followingCount: 1,
                followersCount: 12,
                postsCount: 2
            )
        ),
        .init(
            id: "F8624FBC-076C-4619-9603-8812F03AF637",
            userName: "Ironman",
            profileImageUrl: "iron-man-1",
            fullName: "Tony Stark",
            bio: "Playboy $ Billionare",
            email: "ironman@gmail.com",
            stats: UserStats(
                followingCount: 1,
                followersCount: 1,
                postsCount: 1
            )
        ),
        .init(
            id: "832C4061-A929-4BC2-A5A7-B2603D72D6B4",
            userName: "Black Panther",
            profileImageUrl: "black-panther-2",
            fullName: "Bruce Wayne",
            bio: "Wakanda Forever",
            email: "blackpanther@gmail.com",
            stats: UserStats(
                followingCount: 1,
                followersCount: 1,
                postsCount: 1
            )
        ),
        .init(
            id: "2DC3A410-C31E-486A-B802-06A53967AAB5",
            userName: "Spiderman",
            profileImageUrl: "spiderman",
            fullName: "Peter Parker",
            bio: "Test bio",
            email: "spiderman@gmail.com",
            stats: UserStats(
                followingCount: 1,
                followersCount: 1,
                postsCount: 1
            )
        )
    ]
}
