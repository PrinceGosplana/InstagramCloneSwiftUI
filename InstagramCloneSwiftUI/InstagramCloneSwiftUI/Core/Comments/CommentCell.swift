//
//  CommentCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 12.05.2024.
//

import SwiftUI

struct CommentCell: View {

    private var mockUser: User { User.mockUsers[0] }

    var body: some View {
        HStack {
            CircularImage(user: User.mockUsers[0], size: .xSmall)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(mockUser.userName)
                        .fontWeight(.semibold)

                    Text("6d")
                        .foregroundStyle(.gray)
                }

                Text("How's the back of my car look?")
            }
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CommentCell()
}
