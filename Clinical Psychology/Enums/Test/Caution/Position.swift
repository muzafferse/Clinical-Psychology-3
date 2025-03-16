//
//  Position.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 14.09.2024.
//

import Foundation

enum Position: String, CaseIterable {
    case top = "Alt"
    case bottom = "Üst"
    
    var reversed: Position {
        switch self {
        case .top:
            return .bottom
        case .bottom:
            return .top
        }
    }
}
