//
//  InstagramCloneSwiftUIApp.swift
//  InstagramCloneSwiftUI
//
//  Created by Oleksandr Isaiev on 15.04.2024.
//

import SwiftUI
//import FirebaseCore


//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

@main
struct InstagramCloneSwiftUIApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authManager = AuthManager(service: AuthService())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authManager)
        }
    }
}
