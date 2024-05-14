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
            CircularImage(user: nil, size: .xSmall)
            // notification message
            HStack {
                Text("yuki ")
                    .font(.subheadline)
                    .fontWeight(.semibold) +

                Text("\(notification.type.notificationMessage) ")
                    .font(.subheadline) +

                Text(" 3w")
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }

            Spacer()

            if notification.type != .follow {
                PostImageView()
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
