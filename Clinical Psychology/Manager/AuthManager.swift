//
//  AuthManager.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 18.08.2024.
//

import Firebase
import FirebaseAuth

@MainActor
class AuthManager: ObservableObject {
    static let shared = AuthManager()
    
    @Published var user: User?
    @Published var authState = AuthState.loading
    
    private var authStateHandle: AuthStateDidChangeListenerHandle!
    
    private init() {
        self.authState = .loading
        self.user = Auth.auth().currentUser
        self.authState = self.user != nil ? .signedIn : .signedOut
        self.configureAuthStateChanges()
    }
    
    func configureAuthStateChanges() {
        authStateHandle = Auth.auth().addStateDidChangeListener { auth, user in
            print("Auth changed: \(user != nil)")
            self.updateState(user: user)
        }
    }
    
    func removeAuthStateListener() {
        Auth.auth().removeStateDidChangeListener(authStateHandle)
    }
    
    func updateState(user: User?) {
        self.user = user
        self.authState = user != nil ? .signedIn : .signedOut
    }
    
    func signOut() async throws {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
            } catch let error as NSError {
                print("FirebaseAuthError: failed to sign out from Firebase, \(error)")
                throw error
            }
        }
    }
    
    func signIn(withEmail email: String, password: String, completion: @escaping (Bool, AuthError?) -> Void) {
        Auth.auth().signIn(withEmail: email + "@gmail.com",
                           password: password) { authResult, error in
            if let error = error as NSError? {
                let authError = AuthError(error: error)
                completion(false, authError)
            } else {
                self.updateState(user: authResult?.user)
                NotificationCenter.default.post(name: .didLogin, object: nil)
                completion(true, nil)
            }
        }
    }
    
    func register(withEmail email: String, password: String, completion: @escaping (Bool, AuthError?) -> Void) {
        Auth.auth().createUser(withEmail: email + "@gmail.com",
                               password: password) { authResult, error in
            if let error = error as NSError? {
                let authError = AuthError(error: error)
                completion(false, authError)
            } else if let authResult = authResult {
                self.user = authResult.user
                completion(true, nil)
            }
        }
    }
    
    func refreshUser() {
        Auth.auth().currentUser?.reload(completion: { error in
            if let error = error {
                print("Reload error: \(error)")
            } else {
                self.updateState(user: Auth.auth().currentUser)
            }
        })
    }
}
