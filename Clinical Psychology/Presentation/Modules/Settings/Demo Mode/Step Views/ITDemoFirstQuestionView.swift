//
//  ITDemoFirstQuestionView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 16.02.2025.
//

import SwiftUI

struct ITDemoFirstQuestionView: View {
    let viewModel: ITDemoViewModel
    @Binding var answer: String
    @State private var showCompletedSentence: Bool = false
    
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
    }
    
    private func handleCorrectAnswer() {
        showCompletedSentence = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            showCompletedSentence = false
            viewModel.nextStep()
        }
    }
}

extension ITDemoFirstQuestionView {
    private func textView(text: String) -> some View {
        Text(text)
            .regularTextStyle(size: 16)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    ITDemoFirstQuestionView(viewModel: ITDemoViewModel(),
                            answer: .constant(""))
}
