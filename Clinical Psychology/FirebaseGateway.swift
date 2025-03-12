//
//  FirebaseGateway.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import Firebase

public final class FirebaseGateway {
    /// Configures the Firebase SDK.
    public static func configure() {
        #if CLINIC3A
        let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
        #elseif CLINIC3B
        let filePath = Bundle.main.path(forResource: "GoogleService-Info_3B", ofType: "plist")
        #endif
        if let filePath = filePath,
        let options = FirebaseOptions(contentsOfFile: filePath) {
            FirebaseApp.configure(options: options)
        }
    }
}
