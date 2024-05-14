//
//  NotificationsViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import Foundation

final class NotificationsViewModel: ObservableObject {
    @Published var notifications = [IGNotification]()

    init() {

    }

    func fetchNotifications() {
        notifications = IGNotification.mockNotifications
    }
}
