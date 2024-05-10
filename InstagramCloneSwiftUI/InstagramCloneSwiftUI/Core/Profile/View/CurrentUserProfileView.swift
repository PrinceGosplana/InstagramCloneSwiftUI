//
//  CurrentUserProfileView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @EnvironmentObject var authManager: AuthManager
    let user: User

    var body: some View {
        NavigationStack {
            ProfileView(user: user)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task { await authManager.signOut() }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.mockUsers[0])
        .environmentObject(AuthManager(service: MockAuthService()))
}
