//
//  NotificationCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            CircularImage(user: nil, size: .xSmall)
            // notification message
            HStack {
                Text("yuki ")
                    .font(.subheadline)
                    .fontWeight(.semibold) +

                Text("liked one of your post")
                    .font(.subheadline) +

                Text(" 3w")
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }

            Spacer()

            Image(.blackPanther1)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .padding(.leading, 2)
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
