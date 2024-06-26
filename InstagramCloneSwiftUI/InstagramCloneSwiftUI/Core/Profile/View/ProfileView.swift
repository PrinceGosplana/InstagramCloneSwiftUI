//
//  ProfileView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 16.04.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel

    init(user: User) {
        self._viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
    }

    var body: some View {
        ScrollView {
            // header
            ProfileHeader(user: viewModel.user)
                .task { await viewModel.fetchUserStats() }
                .task { await viewModel.checkIfUserIsFollow() }

            // post grid view
            PostGridView(posts: viewModel.posts)
                .task { await viewModel.fetchUserPosts() }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.mockUsers[1])
}
