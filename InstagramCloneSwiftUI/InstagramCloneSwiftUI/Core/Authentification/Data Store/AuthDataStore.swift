//
//  AuthDataStore.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import SwiftUI

final class AuthDataStore: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
}
