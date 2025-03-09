//
//  AppState.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 2.03.2025.
//

import Firebase
import SwiftUI

@MainActor
final class AppState: ObservableObject {
    @Published var selectedTab: AppTab = .home
    @Published var testStatus: TestStatus = .none
    
    ///Manage navigation Flow of app screens
    @Published var homeNavigation: NavigationPath = NavigationPath()
    @Published var settingsNavigation: NavigationPath = NavigationPath()
}
