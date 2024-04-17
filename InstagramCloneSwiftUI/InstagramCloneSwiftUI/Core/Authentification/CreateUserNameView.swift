//
//  CreateUserNameView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct CreateUserNameView: View {
    
    @State private var userName = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 12) {
            Text("Create user name")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            TextField("User name", text: $userName)
                .textInputAutocapitalization(.none)
                .modifier(IGTextModifier())

            NavigationLink {
                CreateUserNameView()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(UIColor.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.vertical)

            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }

    }
}

#Preview {
    CreateUserNameView()
}
