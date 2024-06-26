//
//  NotificationCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import SwiftUI

struct NotificationCell: View {

    let notification: IGNotification

    var body: some View {
        HStack {

            NavigationLink(value: notification.user) {
                CircularImage(user: notification.user, size: .xSmall)
            }
            
            // notification message
            HStack {
                Text(notification.user?.userName ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold) +

                Text("\(notification.type.notificationMessage) ")
                    .font(.subheadline) +

                Text(" \(notification.date.timeToString())")
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }

            Spacer()

            if notification.type != .follow {
                NavigationLink(value: notification.post) {
                    PostImageView()
                }
            } else {
                FollowButton()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell(notification: IGNotification.mockNotifications[0])
}

struct PostImageView: View {
    var body: some View {
        Image(.blackPanther1)
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipped()
            .padding(.leading, 2)
    }
}

struct FollowButton: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 88, height: 32)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
}
