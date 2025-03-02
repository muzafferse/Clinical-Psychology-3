//
//  CustomFont.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 26.08.2024.
//

import SwiftUI

// Enum for custom fonts
enum CustomFont: String {
    
    case roboto = "Roboto"
    
    var defaultSize: CGFloat {
        return UIFont.preferredFont(forTextStyle: .body).pointSize
    }
    
    static var `default`: Font {
        return CustomFont.roboto.font(style: .regular, size: UIFont.preferredFont(forTextStyle: .body).pointSize)
    }
    
    func font(style: FontStyle, size: CGFloat) -> Font {
        let fontName = "\(self.rawValue)-\(style.rawValue)"
        return Font.custom(fontName, size: size)
    }
    
    func font(style: FontStyle, size: CGFloat) -> UIFont {
        let fontName = "\(self.rawValue)-\(style.rawValue)"
        return UIFont(name: fontName, size: size) ?? .systemFont(ofSize: size)
    }
}
