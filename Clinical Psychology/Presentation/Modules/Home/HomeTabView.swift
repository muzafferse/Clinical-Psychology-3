//
//  HomeTabView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var appState: AppState
    // Create a ObservedObject for the root view model of the Home tab
    @ObservedObject var parentViewModel: HomeTabRootViewModel
    var sessionManager = SessionManager.shared
    
    var body: some View {
        // Use the NavigationStack to manage navigation within the Home tab
        NavigationStack(path: self.$appState.homeNavigation) {
            // HomeTabRootView is the root view of the home tab
            HomeTabRootView(viewModel: parentViewModel)
                .navigationDestination(for: HomeNavDestination.self) { navDestination in
                    switch navDestination {
                    case .dashboardHome:
                        HomeTabRootView(viewModel: parentViewModel)
                    case .cautionTest:
                        CautionTestView()
                            .onAppear(perform: {
                                appState.testStatus = .cautionTest
                            })
                            .onDisappear(perform: {
                                #if CLINIC1A
                                appState.testStatus = .interpretationTest
                                #elseif CLINIC1B
                                appState.testStatus = .none
                                #endif
                            })
                    case .interpretationTest:
                        InterpretationTestView()
                            .onAppear(perform: {
                                appState.testStatus = .interpretationTest
                            })
                            .onDisappear(perform: {
                                #if CLINIC1A
                                appState.testStatus = .none
                                #elseif CLINIC1B
                                appState.testStatus = .cautionTest
                                #endif
                            })
                    }
                }
        }
    }
}
