//
//  User.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    var userName: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    var email: String

    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static let mockUsers: [User] = [
        .init(id: NSUUID().uuidString, userName: "batman", profileImageUrl: "batman-2", fullName: "Bruce Wayne", bio: "Gotham's Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, userName: "venom", profileImageUrl: "venom-2", fullName: "Eddie Brock", bio: "Venom", email: "venom@gmail.com"),
        .init(id: NSUUID().uuidString, userName: "ironman", profileImageUrl: "iron-man-1", fullName: "Tony Stark", bio: "Playboy $ Billionare", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, userName: "blackpanther", profileImageUrl: "black-panther-2", fullName: "Bruce Wayne", bio: "Wakanda Forever", email: "blackpanther@gmail.com"),
        .init(id: NSUUID().uuidString, userName: "spiderman", profileImageUrl: "spiderman", fullName: "Peter Parker", bio: "Test bio", email: "spiderman@gmail.com")
    ]
}
