//
//  UploadPostView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 18.04.2024.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {

    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var selectedTab: SelectedTab
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var postsManager: PostManager

    var body: some View {
        VStack {
            // action tool bar
            HStack {
                Button {
                   clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")
                }

                Spacer()

                Text("New Post")
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    Task {
                        try await viewModel.uploadPost(from: authManager.currentUser, caption: caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)

            // post image and caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }

                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()

            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
        .onChange(of: viewModel.newPost) { _, _ in
            guard let newPost = viewModel.newPost else { return }
            Task { await postsManager.uploadPost(newPost) }
        }
    }

    func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        selectedTab = .feed
    }
}

#Preview {
    UploadPostView(selectedTab: .constant(SelectedTab.uploadPost))
        .environmentObject(AuthManager(service: MockAuthService()))
}
