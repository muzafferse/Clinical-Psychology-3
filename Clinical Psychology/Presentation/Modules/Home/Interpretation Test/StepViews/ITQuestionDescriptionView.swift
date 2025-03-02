//
//  ITQuestionDescriptionView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 10.11.2024.
//

import SwiftUI

struct ITQuestionDescriptionView: View {
    let viewModel: InterpretationTestViewModel
    @State private var isGestureEnabled: Bool = false
    
    var body: some View {
        VStack(spacing: 32) {
            if let currentQuestion = viewModel.getCurrentQuestion() {
                Text(currentQuestion.questionDescription)
                    .regularTextStyle(size: 16)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .onTapGesture {
            if isGestureEnabled {
                viewModel.nextStep()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                isGestureEnabled = true
            }
        }
    }
}

#Preview {
    ITQuestionDescriptionView(viewModel: InterpretationTestViewModel())
}
