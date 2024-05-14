//
//  NotificationManager.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import Foundation

class NotificationManager {

    private let service: NotificationServiceProtocol

    static let shared = NotificationManager(service: NotificationService())
    private init(service: NotificationServiceProtocol) {
        self.service = service
    }

    func uploadLikeNotification(toUid uid: String, post: Post) async {
        await service.uploadNotification(toUid: uid, type: .like, post: post)
    }

    func uploadCommentNotification(toUid uid: String, post: Post) async {
        await service.uploadNotification(toUid: uid, type: .comment, post: post)
    }

    func uploadFollowNotification(toUid uid: String) async {
        await service.uploadNotification(toUid: uid, type: .follow, post: nil)
    }
}
