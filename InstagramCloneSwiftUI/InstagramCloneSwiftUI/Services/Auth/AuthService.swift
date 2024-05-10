//
//  AuthService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 18.04.2024.
//

//import FirebaseAuth
//import FirebaseFirestoreSwift
//import FirebaseFirestore


actor AuthService: AuthServiceProtocol {

    static let shared = AuthService()
    private let mockUser = User.mockUsers[1]
    func login(withEmail email: String, password: String) async throws -> User {

        var user = User.mockUsers.filter { $0.email == email }.first
        if user == nil {

            return User(
                id: mockUser.id,
                userName: mockUser.userName ,
                profileImageUrl: mockUser.profileImageUrl,
                fullName: mockUser.fullName,
                bio: mockUser.bio,
                email: email
            )
        }
        user?.email = email.isEmpty ? mockUser.email : email
        guard let user else { return mockUser }
        return user
    }

    func createUser(email: String, password: String, fullName: String) async throws -> User {
        var user = User.mockUsers.filter { $0.email == email }.first
        if user == nil {
            return User(
                id: mockUser.id,
                userName: fullName.isEmpty ? mockUser.userName : fullName,
                profileImageUrl: mockUser.profileImageUrl,
                fullName: fullName.isEmpty ? mockUser.userName : fullName,
                bio: "Gotham's Dark Knight",
                email: email.isEmpty ? mockUser.email : email
            )
        }
        user?.fullName = fullName.isEmpty ? mockUser.userName : fullName
        user?.email = email.isEmpty ? mockUser.email : email
        guard let user else { return mockUser }
        return user
    }

    func loadUserData() async throws {

    }

    func signOut() async throws {
        //        try? Auth.auth().signOut()
    }
}
