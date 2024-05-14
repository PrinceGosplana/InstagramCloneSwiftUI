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

    init(service: NotificationServiceProtocol) {
        self.service = service
    }

    func fetchNotifications() {
        Task { 
            let values = try await service.fetchNotifications()
            await MainActor.run {
                notifications = values
            }
        }
    }
}
