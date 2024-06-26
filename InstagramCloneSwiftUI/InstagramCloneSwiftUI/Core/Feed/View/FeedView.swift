//
//  FeedView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 16.04.2024.
//

import SwiftUI

struct FeedView: View {

    @EnvironmentObject var postManager: PostManager

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(postManager.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.instagramLogoBlack)
                        .resizable()
                        .frame(width: 100, height: 32)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    FeedView()
        .environmentObject(PostManager(service: MockPostsService()))
}
