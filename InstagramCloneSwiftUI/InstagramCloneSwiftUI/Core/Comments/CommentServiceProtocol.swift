//
//  CommentServiceProtocol.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 12.05.2024.
//

import Foundation

protocol CommentServiceProtocol {
    func uploadComment(_ comment: Comment) async throws
    func fetchComments() async throws -> [Comment]
}
