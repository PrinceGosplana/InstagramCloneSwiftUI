//
//  Comments.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 12.05.2024.
//

import SwiftUI

struct Comments: View {

    private var user: User
    @State private var commentText = ""
    @StateObject var viewModel: CommentsViewModel

    init(post: Post, user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: CommentsViewModel(post: post, user: user))
    }

    var body: some View {
        VStack(spacing: 1) {
            Text("Comments")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 24)

            Divider()

            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }
            }

            Divider()
            HStack(spacing: 12) {
                CircularImage(user: user, size: .xSmall)

                ZStack(alignment: .trailing) {
                    TextField("Add a comment", text: $commentText, axis: .vertical)
                        .font(.footnote)
                        .padding(12)
                        .padding(.trailing, 40)
                        .overlay {
                            Capsule()
                                .stroke(Color(.systemGray5), lineWidth: 1)
                        }

                    Button {
                        Task {
                            await viewModel.uploadComment(commentText: commentText)
                            commentText = ""
                        }
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.systemBlue))
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}

#Preview {
    Comments(post: Post.mockPosts[2], user: User.mockUsers[1])
}
