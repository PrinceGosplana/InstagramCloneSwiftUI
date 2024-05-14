//
//  NotificationServiceProtocol.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import Foundation

protocol NotificationServiceProtocol: AnyObject {
    func fetchNotifications() async throws -> [IGNotification]
    func uploadNotification(toUid uid: String, type: NotificationType, post: Post?) async
    func deleteNotification(toUid uid: String, type: NotificationType, post: Post?) async
}
