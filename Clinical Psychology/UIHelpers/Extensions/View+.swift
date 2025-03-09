//
//  View+.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

extension View {
    @ViewBuilder func active(if condition: Bool) -> some View {
        if condition { self }
    }
}

// MARK: - Hide keyboard
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

// MARK: - Navigation Bar Color
extension View {
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}

// MARK: - Font Modifiers
extension View {
    func robotoMediumFont(size: CGFloat) -> some View {
        self.font(.custom(.roboto, style: .medium, size: size))
    }
    
    func robotoRegularFont(size: CGFloat) -> some View {
        self.font(.custom(.roboto, style: .regular, size: size))
    }
    
    func regularTextStyle(size: CGFloat) -> some View {
        self.modifier(RegularText(size: size))
    }
    
    func mediumTextStyle(size: CGFloat) -> some View {
        self.modifier(MediumText(size: size))
    }
}

// MARK: - Button Modifiers
extension View {
    func primaryActiveButtonStyle() -> some View {
        self.buttonStyle(.customButton(.constant(PrimaryActiveButtonStyle())))
    }
    
    func primaryInactiveButtonStyle() -> some View {
        self.buttonStyle(.customButton(.constant(PrimaryInactiveButtonStyle())))
    }
    
    func textButtonStyle() -> some View {
        self.buttonStyle(.customButton(.constant(TextButtonStyle())))
    }
}

// MARK: - Back Button Modifier
extension View {
    func backButton(text: String, dismissAction: (() -> Void)? = nil) -> some View {
        self.modifier(BackButton(text: text, dismissAction: dismissAction))
    }
}

// MARK: - Text Modifiers
struct RegularText: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .robotoRegularFont(size: size)
            .foregroundStyle(.colorWhite)
    }
}

struct MediumText: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .robotoMediumFont(size: size)
            .foregroundStyle(.colorWhite)
    }
}
