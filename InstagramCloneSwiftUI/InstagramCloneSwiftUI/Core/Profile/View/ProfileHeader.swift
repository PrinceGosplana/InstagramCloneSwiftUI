//
//  ProfileHeader.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct ProfileHeader: View {

    private var user: User {
        viewModel.user
    }

    private var isFollowed: Bool {
        user.isFollowed ?? false
    }

    private var stats: UserStats {
        user.stats ?? .init(followingCount: 0, followersCount: 0, postsCount: 0)
    }

    private var buttonTitle: String {
        if authManager.isCurrentUser(user) {
            "Edit Profile"
        } else {
            isFollowed ? "Following" : "Follow"
        }
    }

    private var buttonBackgroundColor: Color {
        if authManager.isCurrentUser(user) || isFollowed {
            .white
        } else {
            Color(.systemBlue)
        }
    }

    private var buttonForegroundColor: Color {
        if authManager.isCurrentUser(user) || isFollowed {
            .black
        } else {
            .white
        }
    }

    private var buttonBorderColor: Color {
        if authManager.isCurrentUser(user) || isFollowed {
            .gray
        } else {
            .clear
        }
    }

    @State private var showEditProfile = false
    @ObservedObject var viewModel: ProfileViewModel
    @EnvironmentObject var authManager: AuthManager

    init(user: User) {
        viewModel = ProfileViewModel(user: user)
    }

    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                CircularImage(user: user, size: .large)
                
                Spacer()
                
                HStack(spacing: 8) {
                    
                    UserStatView(value: stats.postsCount, title: "Posts")

                    UserStatView(value: stats.followersCount, title: "Followers")

                    UserStatView(value: stats.followingCount, title: "Following")

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
                    handledFollowTapped()
                }
            } label: {
                Text(buttonTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(buttonBackgroundColor)
                    .foregroundStyle(buttonForegroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(buttonBorderColor, lineWidth: 1)
                    )
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
    }

    private func handledFollowTapped() {
        if isFollowed {
            viewModel.unfollow()
        } else {
            viewModel.follow()
        }
    }
}

#Preview {
    ProfileHeader(user: User.mockUsers[0])
        .environmentObject(AuthManager(service: MockAuthService()))
}
