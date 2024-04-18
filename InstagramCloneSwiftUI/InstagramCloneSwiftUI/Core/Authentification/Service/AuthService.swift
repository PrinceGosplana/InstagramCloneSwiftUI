//
//  AuthService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 18.04.2024.
//

import FirebaseAuth

protocol AuthServiceProtocol {
    func login(withEmail email: String, password: String) async throws
    func createUser(email: String, password: String, userName: String) async throws
    func loadUserData() async throws
    func signOut()
}

final class AuthService: AuthServiceProtocol {

    @Published var userSession: FirebaseAuth.User?

    static let shared = AuthService()

    init() {
        self.userSession = Auth.auth().currentUser
    }

    func login(withEmail email: String, password: String) async throws {

    }

    func createUser(email: String, password: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("Failed to register user with error \(error.localizedDescription)")
        }
    }

    func loadUserData() async throws {

    }

    func signOut() {

    }
}
