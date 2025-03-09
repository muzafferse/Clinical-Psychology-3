//
//  InterpretationTestData.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 27.01.2025.
//

import SwiftUI

struct InterpretationTestData: Codable {
    let timeStamp: String
    let questionDescription: String
    let category: String
    let firstQuestion: String
    let firstQuestionAnswer: String
    var givenFirstQuestionAnswer: String
    var firstQuestionResponseTime: Int
    let secondQuestion: String
    let secondQuestionAnswer: String
    var givenSecondQuestionAnswer: String
    var isSecondQuestionAnswerCorrect: String
    var feedback: String
    var secondQuestionResponseTime: Int
}
