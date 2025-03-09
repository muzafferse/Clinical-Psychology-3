//
//  InputFieldView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 3.06.2024.
//

import SwiftUI

struct InputFieldView: View {
    var title: String
    @Binding var text: String
    var textFieldStyle: CustomTextFieldStyle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .mediumTextStyle(size: 14)
            
            LoginTextFieldView(text: $text,
                               loginTextFieldStyle: .constant(textFieldStyle))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    InputFieldView(title: AppStrings.nickName,
                   text: .constant(AppStrings.nickName),
                   textFieldStyle: UsernameTextFieldStyle())
}
