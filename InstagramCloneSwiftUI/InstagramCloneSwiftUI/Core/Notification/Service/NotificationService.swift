//
//  NotificationService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import Foundation

actor NotificationService: NotificationServiceProtocol {

    func fetchNotifications() async throws -> [IGNotification] {
        IGNotification.mockNotifications

    }

    func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let currentUid = UserService.shared.currentUser?.id, uid != currentUid else { return }

        let notification = IGNotification(
            id: "",
            postId: post?.id,
            date: Date(),
            notificationSenderUid: currentUid,
            type: type
        )
    }

    func deleteNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {

    }
}
