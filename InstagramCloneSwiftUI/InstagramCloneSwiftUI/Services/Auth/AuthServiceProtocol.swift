//
//  AuthServiceProtocol.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 09.05.2024.
//

protocol AuthServiceProtocol {
    func login(withEmail email: String, password: String) async throws -> User
    func createUser(email: String, password: String, fullName: String) async throws -> User
    func loadUserData() async throws
    func signOut() async throws
}
