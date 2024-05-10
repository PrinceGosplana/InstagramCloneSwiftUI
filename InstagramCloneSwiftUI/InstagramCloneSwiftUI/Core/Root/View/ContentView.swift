//
//  ContentView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 15.04.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ContentViewModel()
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        Group {
            if authManager.currentUser == nil {
                LoginView()
                    .environmentObject(AuthDataStore())
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthManager(service: MockAuthService()))
}
