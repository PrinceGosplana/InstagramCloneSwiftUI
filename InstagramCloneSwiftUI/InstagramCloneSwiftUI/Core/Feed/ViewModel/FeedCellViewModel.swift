//
//  FeedCellViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 11.05.2024.
//

import SwiftUI

final class FeedCellViewModel: ObservableObject {
    
    @Published var post: Post

    init(post: Post) {
        self.post = post
    }

    func like() {
        post.didLike = true
        post.likes += 1
//        PostsService.shared.
        Task { await NotificationManager.shared.uploadCommentNotification(toUid: post.ownerUid, post: post) }
    }

    func unlike() {
        post.didLike = false
        post.likes -= 1
    }
}
