//
//  PasswordInputFieldView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 3.06.2024.
//

import SwiftUI

struct PasswordInputFieldView: View {
    var title: String
    @Binding var text: String
    @Binding var textFieldStyle: CustomTextFieldStyle
    var toggleAction: () -> Void
    var warningMessage: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .mediumTextStyle(size: 14)
            
            LoginTextFieldView(text: $text,
                               loginTextFieldStyle: $textFieldStyle,
                               onRightButtonTap: toggleAction)
            
            if let warningMessage = warningMessage {
                Text(warningMessage)
                    .robotoRegularFont(size: 12)
                    .foregroundStyle(.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .animation(.easeInOut, value: warningMessage)
    }
}

#Preview {
    PasswordInputFieldView(title: AppStrings.password,
                           text: .constant(AppStrings.password),
                           textFieldStyle: .constant(PasswordTextFieldStyle()),
                           toggleAction: {})
}
