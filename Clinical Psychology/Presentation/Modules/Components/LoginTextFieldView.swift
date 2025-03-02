//
//  LoginTextFieldView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct LoginTextFieldView: View {
    @Binding var text: String
    @Binding var loginTextFieldStyle: CustomTextFieldStyle
    var onRightButtonTap: (() -> Void)?
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        BackgroundView(content: {
            HStack {
                if let leftIcon = loginTextFieldStyle.leftIcon,
                   let leftEmptyIcon = loginTextFieldStyle.leftEmptyIcon {
                    
                    text.isEmpty ? coloredIcon(icon: leftEmptyIcon) : coloredIcon(icon: leftIcon)
                }
                if loginTextFieldStyle.isHidden {
                    SecureField("", text: $text)
                        .robotoMediumFont(size: 13)
                        .foregroundStyle(.colorPrimary)
                        .autocorrectionDisabled()
                        .focused($isFocused)
                } else {
                    TextField("", text: $text)
                        .robotoMediumFont(size: 13)
                        .foregroundStyle(.colorPrimary)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .focused($isFocused)
                }
                
                if let rightIcon = loginTextFieldStyle.rightIcon,
                   let rightTransparentIcon = loginTextFieldStyle.rightTransparentIcon {
                    Button {
                        onRightButtonTap?()
                    } label: {
                        loginTextFieldStyle.isHidden ? coloredIcon(icon: rightTransparentIcon) : coloredIcon(icon: rightIcon)
                    }
                }
            }
        },
                       height: 48)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .onTapGesture {
            isFocused = true
        }
    }
    
    func coloredIcon(icon: Image) -> some View {
        icon
            .foregroundStyle(.colorPrimary)
    }
}

#Preview {
    VStack(spacing: 8) {
        LoginTextFieldView(text: .constant(AppStrings.nickName),
                           loginTextFieldStyle: .constant(UsernameTextFieldStyle()))
    }
    .padding(.horizontal, 8)
}
