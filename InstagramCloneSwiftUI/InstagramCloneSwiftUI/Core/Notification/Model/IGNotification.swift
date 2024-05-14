//
//  IGNotification.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import Foundation

struct IGNotification: Identifiable, Codable {
    let id: String
    let postId: String?
    let date: Date
    let notificationSenderUid: String
    let type: NotificationType
    
    var post: Post?
    var user: User?
}

extension IGNotification {
    static let mockNotifications: [IGNotification] = [
        .init(id: UUID().uuidString, postId: UUID().uuidString, date: Date(), notificationSenderUid: "123", type: .like),
        .init(id: UUID().uuidString, postId: UUID().uuidString, date: Date(), notificationSenderUid: "456", type: .comment),
        .init(id: UUID().uuidString, postId: UUID().uuidString, date: Date(), notificationSenderUid: "363", type: .follow),
        .init(id: UUID().uuidString, postId: UUID().uuidString, date: Date(), notificationSenderUid: "765", type: .like),
        .init(id: UUID().uuidString, postId: UUID().uuidString, date: Date(), notificationSenderUid: "264", type: .comment)
    ]
}
