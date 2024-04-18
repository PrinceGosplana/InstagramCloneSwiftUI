//
//  RegistrationViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 18.04.2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""

    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, userName: userName)
    }
}
