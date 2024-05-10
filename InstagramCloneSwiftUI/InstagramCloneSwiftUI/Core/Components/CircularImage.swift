//
//  CircularImage.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 10.05.2024.
//

import SwiftUI

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large

    var dimensions: CGFloat {
        switch self {
        case .xSmall: 40
        case .small: 48
        case .medium: 64
        case .large: 80
        }
    }
}

struct CircularImage: View {

    let user: User
    let size: ProfileImageSize

    var body: some View {
        if let imageUrl = user.profileImageUrl {
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularImage(user: User.mockUsers[0], size: .large)
}
