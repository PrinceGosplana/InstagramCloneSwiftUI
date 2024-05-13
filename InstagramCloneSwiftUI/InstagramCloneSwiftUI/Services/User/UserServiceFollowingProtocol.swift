//
//  UserServiceFollowingProtocol.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 13.05.2024.
//

import Foundation

protocol UserServiceFollowingProtocol: AnyObject {
    static func follow(uid: String) async throws
    static func unfollow(uid: String) async throws
    static func checkIfUserfollow(uid: String) async throws -> Bool
}
