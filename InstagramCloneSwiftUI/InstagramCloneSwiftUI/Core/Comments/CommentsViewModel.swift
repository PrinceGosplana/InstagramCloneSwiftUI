//
//  CommentsViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 12.05.2024.
//

import Foundation

final class CommentsViewModel: ObservableObject {
    @Published var comments = [Comment]()
    private let post: Post
    private var user: User
    private let service: CommentService

    init(post: Post, user: User) {
        self.post = post
        self.user = user
        self.service = CommentService(postId: post.id)

        Task { try await fetchComments() }
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
        comments.insert(comment, at: 0)
        do {
            try await service.uploadComment(comment)
        } catch {
            print("Error while posting a comment \(error.localizedDescription)")
        }
    }

    @MainActor
    func fetchComments() async throws {
        comments = try await service.fetchComments()
        try await fetchUserDataForComments()
    }

    @MainActor
    private func fetchUserDataForComments() async throws {
        for i in 0 ..< comments.count {
            let comment = comments[i]
            let user = try await UserService.fetchUser(withUid: comment.commentOwnerUid)
            comments[i].user = user
        }
    }
}
