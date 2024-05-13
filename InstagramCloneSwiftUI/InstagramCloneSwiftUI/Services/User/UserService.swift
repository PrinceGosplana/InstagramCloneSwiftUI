//
//  UserService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import Foundation

enum UserServiceErrors: Error {
    case userNotFound
}

final class UserService {

    @Published var currentUser: User?

    static let shared = UserService()
    private var mockUser: User { Constants.currentMockUser }
    private static var users = [User]()
    private init() {}
    
    func fetchCurrentUser() async throws {
        currentUser = mockUser
    }

    func sighOut() async throws {
        currentUser = nil
    }

    static func fetchAllUsers() async throws -> [User] {
        if users.isEmpty {
            users.append(contentsOf: User.mockUsers)
        }
        return users
    }

    static func fetchUser(withUid uid: String) async throws -> User {
        User.mockUsers.filter { $0.id == uid }.first ?? Constants.currentMockUser
    }

}

// MARK: - Following

extension UserService: UserServiceFollowingProtocol {
    static func follow(uid: String) async throws {
        guard let userIndex = userIndex(uid: uid) else { return }
        users[userIndex].isFollowed = true
    }

    static func unfollow(uid: String) async throws {
        guard let userIndex = userIndex(uid: uid) else { return }
        users[userIndex].isFollowed = false
    }

    static func checkIfUserfollow(uid: String) async throws -> Bool {
        guard let userIndex = userIndex(uid: uid) else { return false }
        return users[userIndex].isFollowed ?? false
    }

    private static func userIndex(uid: String) -> Array<User>.Index? {
        guard let user = users.filter({ $0.id == uid }).first else { return nil }
        guard let userIndex = users.firstIndex(of: user) else { return nil }
        return userIndex
    }
}

// MARK: - User Stats

extension UserService {
    static func fetchUserStats(uid: String) async throws -> UserStats {
        guard let userIndex = userIndex(uid: uid) else { throw UserServiceErrors.userNotFound }
        guard let stats = users[userIndex].stats else { throw UserServiceErrors.userNotFound }

        return .init(
            followingCount: stats.followingCount,
            followersCount: stats.followersCount,
            postsCount: stats.postsCount
        )
    }
}
