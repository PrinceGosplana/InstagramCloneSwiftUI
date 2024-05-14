//
//  UsersListViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import Foundation

final class UsersListViewModel: ObservableObject {

    @Published var users = [User]()

    init() {}

    @MainActor
    func fetchUsers(forConfig config: UserListConfig) async {
        do {
            users = try await UserService.fetchUsers(forConfig: config)
        } catch {
            print("Failed to fetch users with error \(error.localizedDescription)")
        }
    }
}
