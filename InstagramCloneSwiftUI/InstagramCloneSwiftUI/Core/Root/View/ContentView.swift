//
//  ContentView.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 15.04.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()

    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
