//
//  Comments.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 12.05.2024.
//

import SwiftUI

struct Comments: View {

    private var mockUser: User { User.mockUsers[0] }

    @State private var commentText = ""

    var body: some View {
        VStack(spacing: 1) {
            Text("Comments")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 24)

            Divider()

            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(Post.mockPosts) { comment in
                        CommentCell()
                    }
                }
            }

            Divider()
            HStack(spacing: 12) {
                CircularImage(user: mockUser, size: .xSmall)

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
    Comments()
}
