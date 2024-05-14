//
//  UsersListViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import Foundation

final class UsersListViewModel: ObservableObject {

    @Published var users = [User]()

    init() {
        Task { try await fetchAllUsers() }
    }

    @MainActor
    func fetchAllUsers() async throws {
        users = try await UserService.fetchAllUsers()
    }
}
