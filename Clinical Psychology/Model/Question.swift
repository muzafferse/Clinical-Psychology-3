//
//  Question.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 29.12.2024.
//

import Foundation

struct Question: Codable, Equatable {
    let questionDescription: String
    let firstQuestion: String
    let firstQuestionAnswer: String
    let secondQuestion: String
    let secondQuestionAnswer: Answer
}
