//
//  CreatePasswordView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct CreatePasswordView: View {

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 12) {

            TitleLoginFlow(title: "Create a password", subtitle: "Your password must be at least 6 characters in length")

            SecureField("Password", text: $viewModel.password)
                .textInputAutocapitalization(.none)
                .modifier(IGTextModifier())
                .padding(.top)

            NavigationLink {
                CompleteSignInView()
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
    CreatePasswordView()
}
