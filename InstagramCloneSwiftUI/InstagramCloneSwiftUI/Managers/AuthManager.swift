//
//  AuthManager.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 09.05.2024.
//

import SwiftUI

final class AuthManager: ObservableObject {

    private let service: AuthServiceProtocol
    @MainActor @Published var currentUser: User?

    init(service: AuthServiceProtocol) {
        self.service = service
    }

    func registerUser(email: String, password: String, fullName: String) async {
        do {
            let user = try await service.createUser(email: email, password: password, fullName: fullName)
            await MainActor.run { currentUser = user }
        } catch {
            print("Register error \(error.localizedDescription)")
        }
    }

    func login(withEmail email: String, password: String) async {
        do {
            let user = try await service.login(withEmail: email, password: password)
            await MainActor.run { currentUser = user }
        } catch {
            print("Login error \(error.localizedDescription)")
        }
    }

    func signOut() async {
        try? await service.signOut()
        await MainActor.run { currentUser = nil }
    }

    @MainActor func isCurrentUser(_ user: User) -> Bool {
        guard let currentUser else { return false }
        return user.id == currentUser.id
    }
}
