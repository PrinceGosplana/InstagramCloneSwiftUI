//
//  Comments.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 12.05.2024.
//

import SwiftUI

struct Comments: View {

    @State private var commentText = ""
    @StateObject var viewModel: CommentsViewModel

    private var currentUser: User? {
        UserService.shared.currentUser
    }

    init(post: Post) {
        self._viewModel = StateObject(wrappedValue: CommentsViewModel(post: post))
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
                CircularImage(user: currentUser, size: .xSmall)

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
    Comments(post: Post.mockPosts[2])
}
