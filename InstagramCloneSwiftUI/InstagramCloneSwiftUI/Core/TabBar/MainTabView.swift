//
//  MainTabView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 16.04.2024.
//

import SwiftUI

enum SelectedTab {
    case feed, search, uploadPost, notification, profile
}

struct MainTabView: View {

    @State private var selectedTab: SelectedTab = .feed

    var body: some View {
        TabView {
            FeedView()
                .onAppear { selectedTab = .feed }
                .tabItem { Image(systemName: "house") }
                .tag(SelectedTab.feed)
            SearchView()
                .onAppear { selectedTab = .search }
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(SelectedTab.search)
            UploadPostView(selectedTab: $selectedTab)
                .onAppear { selectedTab = .uploadPost }
                .tabItem { Image(systemName: "plus.square") }
                .tag(SelectedTab.uploadPost)
            Text("Notification")
                .onAppear { selectedTab = .notification }
                .tabItem { Image(systemName: "heart") }
                .tag(SelectedTab.notification)
            CurrentUserProfileView(user: User.mockUsers[0])
                .onAppear { selectedTab = .profile }
                .tabItem { Image(systemName: "person") }
                .tag(SelectedTab.profile)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
