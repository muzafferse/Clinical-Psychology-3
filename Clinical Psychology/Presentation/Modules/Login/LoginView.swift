//
//  LoginView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    textFieldsView
                    loginButton
                    registerButton
                }
                .padding(.horizontal, 24)
                .padding(.top, 60)
                .onTapGesture {
                    hideKeyboard()
                }
            }
            .clipped()
            .scrollDisabled(true)
            .background(
                Color(.colorBackground)
                    .ignoresSafeArea()
            )
            .navigationTitle(AppStrings.appName)
            .navigationBarTitleTextColor(.colorWhite)
            .navigationBarTitleDisplayMode(.large)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text(AppStrings.loginPopupTitle),
                  message: Text(viewModel.alertMessage),
                  dismissButton: .default(Text(AppStrings.loginPopupButtonText)))
        }
    }
}

extension LoginView {
    private var textFieldsView: some View {
        VStack(spacing: 24) {
            
            // User Nickname Textfield
            InputFieldView(title: AppStrings.nickName,
                           text: $viewModel.nickName,
                           textFieldStyle: UsernameTextFieldStyle())
            
            // Password Textfield
            PasswordInputFieldView(title: AppStrings.password,
                                   text: $viewModel.password,
                                   textFieldStyle: $viewModel.passwordTextFieldStyle,
                                   toggleAction: { viewModel.passwordTextFieldStyle.isHidden.toggle()
            },
                                   warningMessage: viewModel.isPasswordEnough() ? nil : AppStrings.loginPasswordLengthWarning)
        }
    }
    
    private var loginButton: some View {
        // Login Button
        Button(action: {
            AuthManager.shared.signIn(withEmail: viewModel.nickName,
                                      password: viewModel.password) { success, error in
                if success {
                    AuthManager.shared.authState = .signedIn
                    viewModel.clearTextFields()
                    appState.selectedTab = .home
                } else if let error = error {
                    viewModel.alertMessage = error.localizedDescription
                    viewModel.showAlert = true
                }
            }
        },
               label: {
            Text(AppStrings.loginButtonText)
        })
        .buttonStyle(.customButton(.constant(viewModel.loginButtonStyle)))
        .disabled(!viewModel.isLoginButtonActive())
    }
    
    private var registerButton: some View {
        // Register Button
        NavigationLink(destination: RegisterView()) {
            Text(AppStrings.registerButtonText)
        }
        .onDisappear {
            viewModel.clearTextFields()
        }
        .textButtonStyle()
    }
}

#Preview {
    LoginView()
}
