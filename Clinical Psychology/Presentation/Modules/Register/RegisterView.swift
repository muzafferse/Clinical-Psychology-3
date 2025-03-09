//
//  RegisterView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 3.06.2024.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel = RegisterViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    VStack(spacing: 24) {
                        
                        // User Nickname Textfield
                        InputFieldView(title: AppStrings.nickName,
                                       text: $viewModel.nickName,
                                       textFieldStyle: UsernameTextFieldStyle())
                        
                        // Password Textfield
                        PasswordInputFieldView(title: AppStrings.password,
                                               text: $viewModel.password,
                                               textFieldStyle: $viewModel.passwordTextFieldStyle,
                                               toggleAction: {
                            viewModel.passwordTextFieldStyle.isHidden.toggle()
                        })
                        
                        // Re-Password Textfield
                        PasswordInputFieldView(title: AppStrings.repeatPassword,
                                               text: $viewModel.repassword,
                                               textFieldStyle: $viewModel.repasswordTextFieldStyle,
                                               toggleAction: {
                            viewModel.repasswordTextFieldStyle.isHidden.toggle()
                        },
                                               warningMessage: viewModel.isPasswordsMatch() ? nil : AppStrings.registerPasswordMatchWarning)
                    }
                    
                    // Register Button
                    Button(action: {
                        AuthManager.shared.register(withEmail: viewModel.nickName,
                                                    password: viewModel.password) { success, error in
                            if success {
                                viewModel.clearTextFields()
                                appState.selectedTab = .home
                                dismiss()
                            } else if let error = error {
                                viewModel.alertMessage = error.localizedDescription
                                viewModel.showAlert = true
                            }
                        }
                    },
                           label: {
                        Text(AppStrings.registerButtonText)
                    })
                    .buttonStyle(.customButton(.constant(viewModel.registerButtonStyle)))
                    .disabled(!viewModel.isRegisterButtonActive())
                    
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
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text(AppStrings.registerPopupTitle),
                  message: Text(viewModel.alertMessage),
                  dismissButton: .default(Text(AppStrings.registerPopupButtonText)))
        }
        .navigationBarBackButtonHidden()
        .navigationTitle(AppStrings.appName)
        .navigationBarTitleTextColor(.colorWhite)
        .navigationBarTitleDisplayMode(.large)
        .backButton(text: AppStrings.registerBackButtonText,
                    dismissAction: viewModel.clearTextFields)
    }
}

#Preview {
    RegisterView()
}
