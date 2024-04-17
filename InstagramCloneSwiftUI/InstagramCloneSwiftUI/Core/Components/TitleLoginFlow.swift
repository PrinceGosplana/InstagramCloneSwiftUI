//
//  TitleLoginFlow.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct TitleLoginFlow: View {

    var title: String
    var subtitle: String

    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
        }
    }
}


#Preview {
    TitleLoginFlow(title: "Title", subtitle: "Subtitle")
}
