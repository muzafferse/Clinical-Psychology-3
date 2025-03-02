//
//  UIFont+.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

// Extension on Font to use custom fonts easily
extension Font {
    static func custom(_ font: CustomFont = .roboto, style: FontStyle = .regular, size: CGFloat) -> Font {
        return font.font(style: style, size: size)
    }
}

// Extension on Font to use custom fonts easily
extension UIFont {
    static func custom(_ font: CustomFont = .roboto, style: FontStyle = .regular, size: CGFloat) -> UIFont {
        return font.font(style: style, size: size)
    }
}
