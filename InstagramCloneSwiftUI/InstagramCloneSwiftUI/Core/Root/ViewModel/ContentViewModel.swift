//
//  ContentViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 18.04.2024.
//

import SwiftUI
import Firebase
import Combine

@MainActor
final class ContentViewModel: ObservableObject {

    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?

    init() {
        setupSubscribers()
    }

    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
