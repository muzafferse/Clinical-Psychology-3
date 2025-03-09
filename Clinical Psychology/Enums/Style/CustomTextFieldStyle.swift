//
//  CustomTextFieldStyle.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

protocol CustomTextFieldStyle {
    var leftIcon: Image? { get set }
    var leftEmptyIcon: Image? { get set }
    var rightIcon: Image? { get set }
    var rightTransparentIcon: Image? { get set }
    var isHidden: Bool { get set }
}

struct UsernameTextFieldStyle: CustomTextFieldStyle {
    var leftIcon: Image? = Image.userIcon
    var leftEmptyIcon: Image? = Image.userEmptyIcon
    var rightIcon: Image? = nil
    var rightTransparentIcon: Image? = nil
    var isHidden: Bool = false
}

struct PasswordTextFieldStyle: CustomTextFieldStyle {
    var leftIcon: Image? = Image.passwordIcon
    var leftEmptyIcon: Image? = Image.passwordEmptyIcon
    var rightIcon: Image? = Image.hideIcon
    var rightTransparentIcon: Image? = Image.showIcon
    var isHidden: Bool = true
}
