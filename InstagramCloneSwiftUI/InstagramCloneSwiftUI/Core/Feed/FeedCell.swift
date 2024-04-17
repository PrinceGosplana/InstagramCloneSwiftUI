//
//  FeedCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 16.04.2024.
//

import SwiftUI

struct FeedCell: View {

    let post: Post

    var body: some View {
        VStack {
            // image + username
            HStack {
                if let user = post.user {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

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
                    // post
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
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
}

#Preview {
    FeedCell(post: Post.mockPosts[0])
}
