//
//  Clinical_Psychology_3App.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 2.03.2025.
//

import SwiftUI

@main
struct Clinical_Psychology_3App: App {
    @UIApplicationDelegateAdaptor(AppCoordinator.self) var appCoordinator
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(appState)
        }
    }
}
