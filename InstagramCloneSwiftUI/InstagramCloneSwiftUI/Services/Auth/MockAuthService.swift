//
//  MockAuthService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 09.05.2024.
//

actor MockAuthService: AuthServiceProtocol {

    private var user: User?

    static let shared = MockAuthService()

    func login(withEmail email: String, password: String) async throws -> User {
        Constants.currentMockUser
    }

    func createUser(email: String, password: String, fullName: String) async throws -> User {
        Constants.currentMockUser
    }

    func loadUserData() async throws { }

    func signOut() async throws {
        user = nil
    }
}
