//
//  ITDemoSecondQuestionView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 16.02.2025.
//

import SwiftUI

struct ITDemoSecondQuestionView: View {
    let viewModel: ITDemoViewModel
    @State private var isButtonDisabled = false
    var onCompletion: ((Bool) -> Void)
    
    var body: some View {
        VStack(spacing: 96) {
            if let currentQuestion = viewModel.getCurrentQuestion() {
                Text(currentQuestion.secondQuestion)
                    .regularTextStyle(size: 16)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 96) {
                    Button(action: {
                        handleSelection(isCorrect: currentQuestion.secondQuestionAnswer == .yes)
                    }, label: {
                        Text(AppStrings.itYes)
                    })
                    .frame(width: 96, height: 48)
                    .primaryActiveButtonStyle()
                    .disabled(isButtonDisabled)
                    
                    Button(action: {
                        handleSelection(isCorrect: currentQuestion.secondQuestionAnswer == .no)
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
        .onReceive(Timer.publish(every: 20, on: .main, in: .common).autoconnect()) { _ in
            if !isButtonDisabled {
                handleSelection(isCorrect: false)
            }
        }
    }
    
    private func handleSelection(isCorrect: Bool) {
        guard !isButtonDisabled else { return }
        isButtonDisabled = true
        onCompletion(isCorrect)
    }
}

#Preview {
    ITDemoSecondQuestionView(viewModel: ITDemoViewModel(),
                             onCompletion: { _ in })
}
