//
//  CustomButtonView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct CustomButtonView: ButtonStyle {
    @Binding var buttonType: CustomButtonStyle
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(buttonType.foregroundColor)
            .font(buttonType.font)
            .underline(buttonType.hasUnderline)
            .multilineTextAlignment(.center)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .background(buttonType.backgroundColor)
            .cornerRadius(buttonType.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: buttonType.cornerRadius)
                    .stroke(buttonType.strokeColor, lineWidth: 1))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeOut(duration: 0.5), value: configuration.isPressed)
    }
}

#Preview {
    HStack {
        VStack(spacing: 32) {
            Button(action: { },
                   label: {
                Text(AppStrings.settings)
            })
            .primaryActiveButtonStyle()
            
            Button(action: { },
                   label: {
                Text(AppStrings.home)
            })
            .primaryInactiveButtonStyle()
            .disabled(true)
        }
    }
    .padding(.horizontal)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(
        Color(.colorWhite)
            .ignoresSafeArea()
    )
}
