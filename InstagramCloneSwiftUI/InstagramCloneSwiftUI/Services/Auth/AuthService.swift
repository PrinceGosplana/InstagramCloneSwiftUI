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

    private var user: User?

    static let shared = AuthService()

    func login(withEmail email: String, password: String) async throws -> User {

        var user = User.mockUsers.filter { $0.email == email }.first
        if user == nil {
            return User(
                id: "BC0B7A87-B914-47AA-A4A5-E37294CF236E",
                userName: User.mockUsers[0].userName ,
                profileImageUrl: User.mockUsers[0].profileImageUrl,
                fullName: User.mockUsers[0].fullName,
                bio: User.mockUsers[0].bio,
                email: email
            )
        }
        user?.email = email.isEmpty ? User.mockUsers[0].email : email
        guard let user else { return User.mockUsers[0] }
        return user
    }

    func createUser(email: String, password: String, fullName: String) async throws -> User {
        var user = User.mockUsers.filter { $0.email == email }.first
        if user == nil {
            return User(
                id: "BC0B7A87-B914-47AA-A4A5-E37294CF236E",
                userName: fullName.isEmpty ? User.mockUsers[0].userName : fullName,
                profileImageUrl: "batman-2",
                fullName: fullName.isEmpty ? User.mockUsers[0].userName : fullName,
                bio: "Gotham's Dark Knight",
                email: email.isEmpty ? User.mockUsers[0].email : email
            )
        }
        user?.fullName = fullName.isEmpty ? User.mockUsers[0].userName : fullName
        user?.email = email.isEmpty ? User.mockUsers[0].email : email
        guard let user else { return User.mockUsers[0] }
        return user
    }

    func loadUserData() async throws {

    }

    func signOut() async throws {
//        try? Auth.auth().signOut()
        user = nil
    }
}
