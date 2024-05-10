//
//  UserService.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import Foundation

struct UserService {

    static func fetchAllUsers() async throws -> [User] {
        User.mockUsers
    }
}
