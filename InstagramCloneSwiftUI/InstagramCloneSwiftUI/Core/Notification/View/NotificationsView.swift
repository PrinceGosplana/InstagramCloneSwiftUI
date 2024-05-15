//
//  NotificationsView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import SwiftUI

struct NotificationsView: View {

    @StateObject var viewModel = NotificationsViewModel(service: NotificationService())

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.notifications) { notification in
                        NotificationCell(notification: notification)
                            .padding()
                    }
                }
            }
            .task {
                viewModel.fetchNotifications()
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationDestination(for: Post.self, destination: { post in
                FeedCell(post: post)
            })
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationsView()
}
