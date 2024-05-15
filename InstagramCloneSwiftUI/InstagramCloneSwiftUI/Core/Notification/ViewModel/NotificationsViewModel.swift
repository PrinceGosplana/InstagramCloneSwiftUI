//
//  NotificationsViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import Foundation

final class NotificationsViewModel: ObservableObject {
    @MainActor @Published var notifications = [IGNotification]()

    private let service: NotificationServiceProtocol
    private var currentUser: User?

    init(service: NotificationServiceProtocol) {
        self.service = service
        currentUser = UserService.shared.currentUser
    }

    func fetchNotifications() {
        Task { 
            let values = try await service.fetchNotifications()
            await MainActor.run {
                notifications = values
            }
            try await updateNOtifications()
        }
    }

    @MainActor 
    private func updateNOtifications() async throws {
        for i in 0 ..< notifications.count {
            var notification = notifications[i]
            notification.user = try await UserService.fetchUser(withUid: notification.notificationSenderUid)

            if let postId = notification.postId {
                notification.post = try await PostsService.fetchPost(postId)
                notification.post?.user = UserService.shared.currentUser
            }
            notifications[i] = notification

        }
    }
}
