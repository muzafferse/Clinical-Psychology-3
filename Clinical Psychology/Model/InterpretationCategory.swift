//
//  InterpretationCategory.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 29.12.2024.
//

import Foundation

struct InterpretationCategory: Codable {
    let category: Category
    let questions: [Question]
}
