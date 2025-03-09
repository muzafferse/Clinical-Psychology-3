//
//  AppCordinator.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import UIKit

class AppCoordinator: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Handle app Did Finish Launching With Options
        FirebaseGateway.configure()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Handle app entering background
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Handle app entering foreground
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Handle app termination
    }
}
