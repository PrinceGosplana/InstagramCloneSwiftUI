//
//  UsersList.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 14.05.2024.
//

import SwiftUI

struct UsersList: View {

    @StateObject var viewModel = UsersListViewModel()
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.users) { user in
                    NavigationLink(value: user) {
                        HStack {
                            CircularImage(user: user, size: .xSmall)

                            VStack(alignment: .leading) {
                                Text(user.userName)
                                    .fontWeight(.semibold)

                                if let fullName = user.fullName {
                                    Text(fullName)
                                }
                            }
                            .font(.footnote)

                            Spacer()
                        }
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.top, 8)
            .searchable(text: $searchText, prompt: "Search...")
        }
    }
}

#Preview {
    UsersList()
}
