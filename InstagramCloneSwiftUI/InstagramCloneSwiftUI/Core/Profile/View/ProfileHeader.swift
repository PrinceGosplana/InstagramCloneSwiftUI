//
//  ProfileHeader.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct ProfileHeader: View {

    let user: User
    @State private var showEditProfile = false
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 8) {
                    
                    UserStatView(value: 3, title: "Posts")
                    
                    UserStatView(value: 3, title: "Followers")
                    
                    UserStatView(value: 24, title: "Following")
                    
                }
            }
            .padding(.horizontal)
            
            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            
            Button {
                if authManager.isCurrentUser(user) {
                    showEditProfile.toggle()
                } else {
                    // follow
                }
            } label: {
                Text(authManager.isCurrentUser(user) ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(authManager.isCurrentUser(user) ? .white : Color(UIColor.systemBlue))
                    .foregroundStyle(authManager.isCurrentUser(user) ? .black : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(authManager.isCurrentUser(user) ?  Color.gray : .clear, lineWidth: 1)
                    )
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
    }
}

#Preview {
    ProfileHeader(user: User.mockUsers[0])
        .environmentObject(AuthManager(service: MockAuthService()))
}
