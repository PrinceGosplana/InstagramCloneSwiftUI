//
//  EditProfileView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 19.04.2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {

    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: EditProfileViewModel

    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }

    var body: some View {
        VStack {
            // toolbar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    Spacer()

                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    Spacer()

                    Button {
                        Task { try await viewModel.updateUserData() }
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)

                Divider()
            }

            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(Circle())
                    }

                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)

                    Divider()
                }
            }
            .padding(.vertical, 8)

            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.fullName)

                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
            }

            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.mockUsers[0])
}
