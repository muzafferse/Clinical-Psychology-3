//
//  ITFirstQuestionView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 11.11.2024.
//

import SwiftUI

struct ITFirstQuestionView: View {
    let viewModel: InterpretationTestViewModel
    @Binding var answer: String
    
    @State private var showCompletedSentence: Bool = false
    @State private var startTime: Date?
    
    private var completedSentence: String {
        if let currentQuestion = viewModel.getCurrentQuestion() {
            let question = currentQuestion.firstQuestion
            let answer = currentQuestion.firstQuestionAnswer
            return question.replacingOccurrences(of: "_", with: answer)
        } else {
            return ""
        }
    }
    
    var body: some View {
        VStack(spacing: 32) {
            if showCompletedSentence {
                textView(text: completedSentence)
            } else {
                if let question = viewModel.getCurrentQuestion()?.firstQuestion {
                    textView(text: question)
                }
                if let expectedAnswer = viewModel.getCurrentQuestion()?.firstQuestionAnswer {
                    AnswerTextFieldView(text: $answer,
                                        expectedCharacter: expectedAnswer) {
                        handleCorrectAnswer()
                    }
                                        .frame(width: 200)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .onAppear {
            startTime = Date()
            viewModel.initializeCurrentQuestionData()
        }
    }
    
    private func handleCorrectAnswer() {
        showCompletedSentence = true
        if let startTime = startTime {
            let responseTime = Int(Date().timeIntervalSince(startTime) * 1000)
            viewModel.updateFirstQuestionData(givenAnswer: answer, responseTime: responseTime)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            showCompletedSentence = false
            viewModel.nextStep()
        }
    }
}

extension ITFirstQuestionView {
    private func textView(text: String) -> some View {
        Text(text)
            .regularTextStyle(size: 16)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    ITFirstQuestionView(viewModel: InterpretationTestViewModel(),
                        answer: .constant(""))
}
