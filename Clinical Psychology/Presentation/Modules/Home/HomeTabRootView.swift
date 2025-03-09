//
//  HomeTabRootView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

// MARK: - HomeView
// The main view for displaying the Home dashboard
struct HomeTabRootView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: HomeTabRootViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 32) {
                let username = AuthManager.shared.user?.email?.components(separatedBy: "@").first ?? AppStrings.guestUser
                Text("Merhaba, \(username)")
                    .mediumTextStyle(size: 20)
                
                Text(AppStrings.welcomeDescription)
                    .regularTextStyle(size: 14)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer(minLength: 0)
            
            Button {
                // MARK: - Starting Test
                #if CLINIC1A
                self.appState.homeNavigation.append(HomeNavDestination.cautionTest)
                #elseif CLINIC1B
                self.appState.homeNavigation.append(HomeNavDestination.interpretationTest)
                #endif
            } label: {
                Text(AppStrings.startTestButtonText)
            }
            .primaryActiveButtonStyle()
            .padding(.bottom, 12)
        }
        .padding(.all, 24)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .navigationTitle(AppStrings.homeTitle)
        .navigationBarTitleTextColor(.colorWhite)
    }
}

#Preview {
    HomeTabRootView(viewModel: HomeTabRootViewModel())
        .environmentObject(AppState())
}
