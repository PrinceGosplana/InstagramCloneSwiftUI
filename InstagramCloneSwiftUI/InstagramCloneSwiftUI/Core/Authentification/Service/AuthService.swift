//
//  AuthService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 18.04.2024.
//

import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

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

    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
        } catch {
            print("Failed to log user with error \(error.localizedDescription)")
        }
    }

    @MainActor
    func createUser(email: String, password: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            print("DEBUG: Did create user...")
            await uploadUserData(uid: result.user.uid, userName: userName, email: email)
            print("DEBUG: Did upload user data...")
        } catch {
            print("Failed to register user with error \(error.localizedDescription)")
        }
    }

    func loadUserData() async throws {

    }

    func signOut() {
        try? Auth.auth().signOut()
        userSession = nil
    }

    private func uploadUserData(uid: String, userName: String, email: String) async {
        let user = User(
            id: uid,
            userName: userName,
            profileImageUrl: nil,
            fullName: nil,
            bio: nil,
            email: email
        )

        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }

        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
