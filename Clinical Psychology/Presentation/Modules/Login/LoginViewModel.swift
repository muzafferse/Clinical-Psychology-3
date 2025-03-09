//
//  LoginViewModel.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var nickName = ""
    @Published var password = ""
    @Published var passwordTextFieldStyle: CustomTextFieldStyle = PasswordTextFieldStyle()
    
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    var loginButtonStyle: CustomButtonStyle {
        return isLoginButtonActive() ? PrimaryActiveButtonStyle() : PrimaryInactiveButtonStyle()
    }
    
    func isLoginButtonActive() -> Bool {
        return !nickName.isEmpty && isPasswordEnough()
    }
    
    func isPasswordEnough() -> Bool {
        return password.count >= 6
    }
    
    func clearTextFields() {
        nickName = ""
        password = ""
    }
}
