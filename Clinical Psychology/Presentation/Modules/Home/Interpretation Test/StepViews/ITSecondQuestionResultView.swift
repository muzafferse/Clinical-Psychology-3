//
//  ITSecondQuestionResultView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 14.11.2024.
//

import SwiftUI

struct ITSecondQuestionResultView: View {
    @ObservedObject var viewModel: InterpretationTestViewModel
    
    var body: some View {
        VStack(spacing: 32) {
            Text(viewModel.isCorrectAnswer ? AppStrings.itCorrect : AppStrings.itIncorrect)
                .regularTextStyle(size: 16)
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                viewModel.nextStep()
            }
        }
    }
}

#Preview {
    ITSecondQuestionResultView(viewModel: InterpretationTestViewModel())
}
