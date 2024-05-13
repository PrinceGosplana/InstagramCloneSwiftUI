//
//  CommentCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 12.05.2024.
//

import SwiftUI

struct CommentCell: View {

    private let comment: Comment
    private var user: User? {
        comment.user
    }

    init(comment: Comment) {
        self.comment = comment
    }

    var body: some View {
        HStack {
            CircularImage(user: user, size: .xSmall)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(user?.userName ?? "")
                        .fontWeight(.semibold)

                    Text(comment.date.timeToString())
                        .foregroundStyle(.gray)
                }

                Text(comment.commentText)
            }
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CommentCell(comment: Comment.mockComment)
}
