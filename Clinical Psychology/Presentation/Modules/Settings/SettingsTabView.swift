//
//  SettingsTabView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import SwiftUI

struct SettingsTabView: View {
    @EnvironmentObject var appState: AppState
    // Create a ObservedObject for the root view model of the Settings tab
    @ObservedObject var parentViewModel: SettingsTabRootViewModel
    
    var body: some View {
        // Use the NavigationStack to manage navigation within the Settings tab
        NavigationStack(path: self.$appState.settingsNavigation) {
            // SettingsTabRootView is the root view of the Settings tab
            SettingsTabRootView(viewModel: parentViewModel)
                .navigationDestination(for: SettingsNavDestination.self) { navDestination in
                    switch navDestination {
                    case .dashboardSettings:
                        SettingsTabRootView(viewModel: parentViewModel)
                    case .interpretationDemo:
                        ITDemoView()
                            .onAppear(perform: {
                                appState.testStatus = .interpretationDemoTest
                            })
                            .onDisappear(perform: {
                                appState.testStatus = .none
                            })
                        //TODO: Future Work - Contributors
                        /*case .contributors:
                         ContributorsView()
                         */
                    }
                }
        }
    }
}
