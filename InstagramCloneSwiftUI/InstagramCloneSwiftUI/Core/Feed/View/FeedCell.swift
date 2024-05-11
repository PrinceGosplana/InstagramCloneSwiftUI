//
//  FeedCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 16.04.2024.
//

import SwiftUI

struct FeedCell: View {

    @ObservedObject var viewModel: FeedCellViewModel
    private var post: Post {
        viewModel.post
    }

    private var didLike: Bool {
        post.didLike ?? false
    }

    init(post: Post) {
        viewModel = FeedCellViewModel(post: post)
    }

    var body: some View {
        VStack {
            // image + username
            HStack {
                if let user = post.user {
                    CircularImage(user: user, size: .xSmall)

                    Text(user.userName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }

                Spacer()
            }
            .padding(.leading, 8)

            // post image

            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())

            // action buttons
            HStack(spacing: 16) {
                Button {
                    handleLikeTapped()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundStyle(didLike ? .red : .black)
                }

                Button {

                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }

                Button {

                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }

                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(.black)

            // likes label

            Text("^[\(post.likes) like](inflect: true)")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)

            // caption label

            HStack {
                Text("\(post.user?.userName ?? "") ").fontWeight(.semibold) +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)

            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(.gray)
        }
    }

    private func handleLikeTapped() {
        Task {
            if didLike {
                try await viewModel.unlike()
            } else {
                try await viewModel.like()
            }
        }
    }
}

#Preview {
    FeedCell(post: Post.mockPosts[0])
}
