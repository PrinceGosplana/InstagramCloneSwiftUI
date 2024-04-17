//
//  AddEmailView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct AddEmailView: View {

    @State private var email = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 12) {

            TitleLoginFlow(title: "Add your email", subtitle: "You'll use this email to sign in to your account")

            TextField("Email", text: $email)
                .textInputAutocapitalization(.none)
                .modifier(IGTextModifier())

            NavigationLink {
                CreateUserNameView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .modifier(IGMainButtonModifier())
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
    AddEmailView()
}
