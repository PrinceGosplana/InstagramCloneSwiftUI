//
//  UserConfig.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 13.05.2024.
//

import Foundation

enum UserListConfig: Hashable {
    case followers(uid: String)
    case following(uid: String)
    case likes(postId: String)
    case explore

    var navigationTitle: String {
        switch self {
        case .followers: "Followers"
        case .following: "Following"
        case .likes: "Likes"
        case .explore: "Explore"
        }
    }
}
