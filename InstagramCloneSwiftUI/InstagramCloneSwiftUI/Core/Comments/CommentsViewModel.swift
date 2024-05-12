//
//  CommentsViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 12.05.2024.
//

import Foundation

final class CommentsViewModel: ObservableObject {
    @Published var comments = [Comments]()
    private let post: Post
    private var user: User

    init(post: Post, user: User) {
        self.post = post
        self.user = user
    }

    func uploadComment(commentText: String) async {

        let comment = Comment(
            id: UUID().uuidString,
            postOwnerId: post.ownerUid,
            commentText: commentText,
            postId: post.id,
            date: Date(),
            commentOwnerUid: user.id,
            user: user
        )

        do {
            try await CommentService.uploadComment(comment, postId: post.id)
        } catch {
            print("Error while posting a comment \(error.localizedDescription)")
        }
    }
}
