//
//  CustomButtonStyle.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

protocol CustomButtonStyle {
    var foregroundColor: Color { get }
    var backgroundColor: Color { get }
    var strokeColor: Color { get }
    var cornerRadius: CGFloat { get }
    var font: Font { get }
    var hasUnderline: Bool { get }
}

struct PrimaryActiveButtonStyle: CustomButtonStyle {
    var foregroundColor: Color { .colorWhite }
    var backgroundColor: Color { .colorPrimary }
    var strokeColor: Color { .colorWhite }
    var cornerRadius: CGFloat { 5.0 }
    var font: Font { .custom(.roboto, style: .medium, size: 14) }
    var hasUnderline: Bool { false }
}

struct PrimaryInactiveButtonStyle: CustomButtonStyle {
    var foregroundColor: Color { .colorWhite }
    var backgroundColor: Color { .colorInactive }
    var strokeColor: Color { .colorWhite }
    var cornerRadius: CGFloat { 5.0 }
    var font: Font { .custom(.roboto, style: .medium, size: 14) }
    var hasUnderline: Bool { false }
}

struct TextButtonStyle: CustomButtonStyle {
    var foregroundColor: Color { .colorWhite }
    var backgroundColor: Color { .clear }
    var strokeColor: Color { .clear }
    var cornerRadius: CGFloat { 5.0 }
    var font: Font { .custom(.roboto, style: .medium, size: 14) }
    var hasUnderline: Bool { true }
}
