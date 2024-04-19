//
//  LoginViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 19.04.2024.
//

import Foundation

final class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""

    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
