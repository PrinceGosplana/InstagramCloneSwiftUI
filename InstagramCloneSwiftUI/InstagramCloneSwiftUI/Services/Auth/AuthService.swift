//
//  AuthService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 18.04.2024.
//

//import FirebaseAuth
//import FirebaseFirestoreSwift
//import FirebaseFirestore

enum AuthError: Error {
    case userNotFound
}

actor AuthService: AuthServiceProtocol {

    static let shared = AuthService()
    private var mockUser: User { Constants.currentMockUser }

    func login(withEmail email: String, password: String) async throws -> User {

        var user = User.mockUsers.filter { $0.email == email }.first
        if user == nil {
            try await loadUserData()
            guard let currentUser = UserService.shared.currentUser else { throw AuthError.userNotFound }
            return currentUser
        }
        user?.email = email.isEmpty ? mockUser.email : email
        guard let user else { return mockUser }
        return user
    }

    func createUser(email: String, password: String, fullName: String) async throws -> User {
        var user = User.mockUsers.filter { $0.email == email }.first
        if user == nil {

            try await loadUserData()
            let currentUser = UserService.shared.currentUser

            return User(
                id: currentUser?.id ?? "",
                userName: fullName.isEmpty ? currentUser?.userName ?? fullName : fullName,
                profileImageUrl: currentUser?.profileImageUrl,
                fullName: fullName.isEmpty ? currentUser?.userName ?? fullName : fullName,
                bio: "Gotham's Dark Knight",
                email: email.isEmpty ? currentUser?.email ?? email : email
            )
        }
        user?.fullName = fullName.isEmpty ? mockUser.userName : fullName
        user?.email = email.isEmpty ? mockUser.email : email
        guard let user else { return mockUser }
        return user
    }

    func loadUserData() async throws {
        try await UserService.shared.fetchCurrentUser()
    }

    func signOut() async throws {
        try await UserService.shared.sighOut()
    }
}
