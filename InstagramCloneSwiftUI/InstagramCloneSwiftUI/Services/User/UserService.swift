//
//  UserService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import Foundation


final class UserService {

    @Published var currentUser: User?

    static let shared = UserService()
    private var mockUser: User { Constants.currentMockUser }

    private init() {}
    
    func fetchCurrentUser() async throws {
        currentUser = mockUser
    }

    func sighOut() async throws {
        currentUser = nil
    }

    static func fetchAllUsers() async throws -> [User] {
        User.mockUsers
    }

    static func fetchUser(withUid uid: String) async throws -> User {
        User.mockUsers.filter { $0.id == uid }.first ?? Constants.currentMockUser
    }

}

// MARK: - Following

extension UserService: UserServiceFollowingProtocol {
    static func follow(uid: String) async throws {

    }

    static func unfollow(uid: String) async throws {

    }

    static func checkIfUserfollow(uid: String) async throws -> Bool {
        false
    }
}
