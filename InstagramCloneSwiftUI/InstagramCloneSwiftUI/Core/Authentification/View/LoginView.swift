//
//  LoginView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct LoginView: View {

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            GeometryReader(content: { geometry in
                VStack {

                    Spacer()

                    // logo image
                    Image(.instagramLogoBlack)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)

                    // text fields
                    VStack {
                        TextField("Enter you email", text: $email)
                            .textInputAutocapitalization(.none)
                            .modifier(IGTextModifier())

                        SecureField("Enter you password", text: $password)
                            .modifier(IGTextModifier())
                    }

                    Button {

                    } label: {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)

                    Button {

                    } label: {
                        Text("Log in")
                            .modifier(IGMainButtonModifier())
                    }
                    .padding(.vertical)

                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width:  (geometry.size.width / 2) - 40, height: 0.5)

                        Text("OR")
                            .font(.footnote)
                            .fontWeight(.semibold)

                        Rectangle()
                            .frame(width:  (geometry.size.width / 2) - 40, height: 0.5)
                        Spacer()
                    }
                    .foregroundStyle(.gray)

                    HStack {
                        Image(.facebookLogo)
                            .resizable()
                            .frame(width: 20, height: 20)

                        Text("Continue with facebook")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(UIColor.systemBlue))
                    }
                    .padding(.top, 8)

                    Spacer()

                    Divider()

                    NavigationLink {
                        AddEmailView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Don't have an account")

                            Text("Sign Up")
                        }
                        .font(.footnote)
                    }
                    .padding(.vertical, 16)
                }
            })
        }
    }
}

#Preview {
    LoginView()
}
