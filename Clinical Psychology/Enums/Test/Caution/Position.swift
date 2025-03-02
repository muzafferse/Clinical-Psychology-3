//
//  Position.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 14.09.2024.
//

import Foundation

enum Position: String, CaseIterable {
    case topNeutral = "Alt"
    case bottomNeutral = "Üst"
    
    var reversed: Position {
        switch self {
        case .topNeutral:
            return .bottomNeutral
        case .bottomNeutral:
            return .topNeutral
        }
    }
}
