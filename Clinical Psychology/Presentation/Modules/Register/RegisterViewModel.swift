//
//  RegisterViewModel.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 3.06.2024.
//

import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var nickName: String = ""
    @Published var password: String = ""
    @Published var passwordTextFieldStyle: CustomTextFieldStyle = PasswordTextFieldStyle()
    @Published var repassword: String = ""
    @Published var repasswordTextFieldStyle: CustomTextFieldStyle = PasswordTextFieldStyle()
    
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    var registerButtonStyle: CustomButtonStyle {
        return isRegisterButtonActive() ? PrimaryActiveButtonStyle() : PrimaryInactiveButtonStyle()
    }
    
    func isRegisterButtonActive() -> Bool {
        return (!nickName.isEmpty && !password.isEmpty && !repassword.isEmpty && isPasswordsMatch())
    }
    
    func isPasswordsMatch() -> Bool {
        return password == repassword
    }
    
    func clearTextFields() {
        nickName = ""
        password = ""
        repassword = ""
    }
}
