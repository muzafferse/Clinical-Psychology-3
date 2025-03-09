//
//  ITSecondQuestionView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 11.11.2024.
//

import SwiftUI

struct ITSecondQuestionView: View {
    let viewModel: InterpretationTestViewModel
    @State private var isButtonDisabled = false
    @State private var startTime: Date?
    var onCompletion: ((Bool) -> Void)
    
    var body: some View {
        VStack(spacing: 96) {
            if let currentQuestion = viewModel.getCurrentQuestion() {
                Text(currentQuestion.secondQuestion)
                    .regularTextStyle(size: 16)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 96) {
                    Button(action: {
                        handleSelection(isCorrect: currentQuestion.secondQuestionAnswer == .yes, givenAnswer: .yes)
                    }, label: {
                        Text(AppStrings.itYes)
                    })
                    .frame(width: 96, height: 48)
                    .primaryActiveButtonStyle()
                    .disabled(isButtonDisabled)
                    
                    Button(action: {
                        handleSelection(isCorrect: currentQuestion.secondQuestionAnswer == .no, givenAnswer: .no)
                    }, label: {
                        Text(AppStrings.itNo)
                    })
                    .frame(width: 96, height: 48)
                    .primaryActiveButtonStyle()
                    .disabled(isButtonDisabled)
                }
                .foregroundStyle(.colorWhite)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .onAppear {
            startTime = Date()
            //100ms sapma olabiliyor
            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                if !isButtonDisabled {
                    handleEmptySelection()
                }
            }
        }
    }
    
    private func handleSelection(isCorrect: Bool, givenAnswer: Answer) {
        isButtonDisabled = true
        if let startTime = startTime {
            let responseTime = Int(Date().timeIntervalSince(startTime) * 1000)
            viewModel.updateSecondQuestionData(givenAnswer: givenAnswer.rawValue, isCorrect: isCorrect, responseTime: responseTime)
        }
        onCompletion(isCorrect)
    }
    
    private func handleEmptySelection() {
        isButtonDisabled = true
        if let startTime = startTime {
            let responseTime = Int(Date().timeIntervalSince(startTime) * 1000)
            viewModel.updateSecondQuestionData(givenAnswer: "BOŞ", isCorrect: false, responseTime: responseTime)
        }
        onCompletion(false)
    }
}

#Preview {
    ITSecondQuestionView(viewModel: InterpretationTestViewModel(),
                         onCompletion: {_ in })
}
