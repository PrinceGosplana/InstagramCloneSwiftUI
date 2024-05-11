//
//  IGMainButtonModifier.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 17.04.2024.
//

import SwiftUI

struct IGMainButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 360, height: 44)
            .background(Color(UIColor.systemBlue))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
