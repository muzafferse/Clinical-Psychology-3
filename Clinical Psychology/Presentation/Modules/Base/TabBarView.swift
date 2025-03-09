//
//  TabBarView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: AppTab
    @EnvironmentObject var appState: AppState
    
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            HStack {
                Group {
                    
                    // Home Tab Button
                    Button(action: {
                        select(tab: .home)
                    }) {
                        VStack(alignment: .center, spacing: 4) {
                            Image(systemName: self.selectedTab == .home ? "house.fill": "house")
                                .foregroundStyle(self.selectedTab == .home ? .colorWhite: .colorInactive)
                                .frame(maxWidth: .infinity,
                                       minHeight: 24,
                                       maxHeight: 24)
                            
                            Text(AppStrings.home)
                                .robotoMediumFont(size: 10)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundStyle(self.selectedTab == .home ? .colorWhite: .colorInactive)
                        }
                        .padding(.horizontal, 0)
                        .padding(.vertical, 5)
                    }
                    .tag(AppTab.home)
                    
                    Spacer()
                    
                    // Settings Tab Button
                    Button(action: {
                        select(tab: .settings)
                    }) {
                        VStack(alignment: .center, spacing: 4) {
                            Image(systemName: self.selectedTab == .settings ? "gearshape.fill": "gearshape")
                                .foregroundStyle(self.selectedTab == .settings ? .colorWhite: .colorInactive)
                                .frame(maxWidth: .infinity,
                                       minHeight: 24,
                                       maxHeight: 24)
                            Text(AppStrings.settings)
                                .robotoMediumFont(size: 10)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundStyle(self.selectedTab == .settings ? .colorWhite: .colorInactive)
                        }
                        .padding(.horizontal, 0)
                        .padding(.vertical, 5)
                    }
                    .tag(AppTab.settings)
                }
            }
            .padding(.bottom, 30)
            .padding(.top, 15)
            .foregroundStyle(.clear)
            .background(.colorBackground)
            .frame(height: 70)
            .shadow(color: .colorShadow,
                    radius: 10,
                    x: 0,
                    y: -2)
        }
        .background(.colorBackground)
        .alert(isPresented: $showAlert) {
            Alert(title: Text(AppStrings.tabBarAlertTitle),
                  message: Text(AppStrings.tabBarAlertDescription),
                  dismissButton: .default(Text(AppStrings.tabBarAlertButtonText))
            )
        }
    }
    
    func select(tab: AppTab) {
        if appState.testStatus != .none {
            showAlert = true
        } else {
            if self.selectedTab == tab {
                returnToRootController(of: tab)
            }
            self.selectedTab = tab
        }
    }
    
    // Clear selected tab's navigation stack, to return to the root VC
    func returnToRootController(of tab: AppTab) {
        switch tab {
        case .home: self.appState.homeNavigation = NavigationPath()
        case .settings: self.appState.settingsNavigation = NavigationPath()
        }
    }
}
