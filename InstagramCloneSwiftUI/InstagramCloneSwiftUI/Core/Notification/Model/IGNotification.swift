//
//  IGNotification.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import Foundation

struct Notification: Identifiable, Codable {
    let id: String
    let postId: String?
    let date: Date
    let uid: String

    var post: Post?
    var user: User?
}
