//
//  CommentServiceProtocol.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 12.05.2024.
//

import Foundation

protocol CommentServiceProtocol {
    static func uploadComment(_ comment: Comment, postId: String) async throws
}
