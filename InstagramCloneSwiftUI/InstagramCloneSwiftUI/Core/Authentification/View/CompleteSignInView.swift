//
//  CompleteSignInView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct CompleteSignInView: View {

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var authDataStore: AuthDataStore

    var body: some View {
        VStack(spacing: 12) {

            Spacer()
            
            Text("Welcome to Instagram, \(authDataStore.fullName)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)

            Text("Click below to complete registration and start using Instagram")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            Button {
                registerUser()
            } label: {
                Text("Complete Sign Up")
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

    private func registerUser() {
        Task {
            await authManager.registerUser(
                email: authDataStore.email,
                password: authDataStore.password,
                fullName: authDataStore.fullName
            )
        }
    }
}

#Preview {
    CompleteSignInView()
        .environmentObject(AuthManager(service: MockAuthService()))
        .environmentObject(AuthDataStore())
}
