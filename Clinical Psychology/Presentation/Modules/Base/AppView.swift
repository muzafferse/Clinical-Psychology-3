//
//  AppView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var appState: AppState
    
    @State var isLaunchScreenViewPresented = false
    
    // Use @StateObject to retain ViewModels.
    @StateObject private var homeTabViewModel = HomeTabRootViewModel()
    @StateObject private var settingsTabViewModel = SettingsTabRootViewModel()
    
    var body: some View {
        if isLaunchScreenViewPresented {
            if AuthManager.shared.authState == .loading {
                ProgressView("Loading...")
            } else if AuthManager.shared.authState == .signedIn {
                VStack {
                    switch self.appState.selectedTab {
                    case .home:
                        HomeTabView(parentViewModel: homeTabViewModel)
                            .navigationBarTitleDisplayMode(.large)
                    case .settings:
                        SettingsTabView(parentViewModel: settingsTabViewModel)
                            .navigationBarTitleDisplayMode(.large)
                    }
                    Spacer()
                    TabBarView(selectedTab: $appState.selectedTab)
                }
                .ignoresSafeArea()
            } else {
                LoginView()
            }
        } else {
            LaunchView(isPresented: $isLaunchScreenViewPresented)
                .onAppear {
                    AuthManager.shared.refreshUser()
                }
        }
    }
}

#Preview {
    AppView()
        .environmentObject(AppState())
}
