//
//  SearchView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct SearchView: View {

    @StateObject var viewModel = SearchViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            UsersList()
                .navigationDestination(for: User.self, destination: { user in
                    ProfileView(user: user)
                })
                .onAppear {
                    Task { try await viewModel.fetchAllUsers() }
                }
                .navigationTitle("Explore")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
