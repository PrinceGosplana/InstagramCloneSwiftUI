//
//  FeedCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 16.04.2024.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            // image + username
            HStack {
                Image(.batman2)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                Text("batman")
                    .font(.footnote)
                    .fontWeight(.semibold)

                Spacer()
            }
            .padding(.leading, 8)

            // post image

            Image(.batman2)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())

            // action buttons
            HStack(spacing: 16) {
                Button {
                    // post
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }

                Button {

                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }

                Button {

                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }

                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(.black)

            // likes label

            Text("233 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)

            // caption label

            HStack {
                Text("batman").fontWeight(.semibold) +
                Text("This is some test caption for now")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)

            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    FeedCell()
}
