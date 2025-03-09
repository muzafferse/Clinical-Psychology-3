//
//  SettingsTabRootView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import SwiftUI

// MARK: - SettingsView
// The main view for displaying the Settings dashboard
struct SettingsTabRootView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: SettingsTabRootViewModel
    
    var body: some View {
        VStack {
            //TODO: Future Work - Contributors
            /*
             VStack(spacing: 3) {
             HStack {
             Button(action: {
             self.appState.settingsNavigation.append(SettingsNavDestination.contributors)
             }) {
             Text(AppStrings.contributorsButtonText)
             .mediumTextStyle(size: 20)
             
             Spacer()
             
             Image.chevronRight
             .foregroundStyle(.colorWhite)
             }
             }
             
             Divider()
             .frame(height: 1)
             .background(.colorInactive)
             }
             .padding(.horizontal, 24)
             */
            
            // MARK: - Demo Mode
            Button(action: {
                self.appState.settingsNavigation.append(SettingsNavDestination.interpretationDemo)
            }) {
                Text(AppStrings.demoModeButtonText)
            }
            .primaryActiveButtonStyle()
            .padding(.all, 24)
            
            // MARK: - Sign Out
            Button(action: {
                Task {
                    do {
                        try await AuthManager.shared.signOut()
                        AuthManager.shared.authState = .signedOut
                        appState.selectedTab = .home
                    } catch {
                        print("Error signing out: \(error)")
                    }
                }
            }) {
                Text(AppStrings.logoutButtonText)
            }
            .primaryActiveButtonStyle()
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .padding(.vertical, 12)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .navigationTitle(AppStrings.settingsTitle)
        .navigationBarTitleTextColor(.colorWhite)
    }
}

#Preview {
    SettingsTabRootView(viewModel: SettingsTabRootViewModel())
}
