//
//  ProfileView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 16.04.2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var posts: [Post] {
        Post.mockPosts.filter({ $0.user?.id == user.id})
    }

    var body: some View {
        ScrollView {
            // header
            ProfileHeader(user: user)

            // post grid view
            PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.mockUsers[1])
        .environmentObject(AuthManager(service: MockAuthService()))
}
