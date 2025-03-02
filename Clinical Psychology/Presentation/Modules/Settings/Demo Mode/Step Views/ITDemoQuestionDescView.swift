//
//  ITDemoQuestionDescView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 16.02.2025.
//

import SwiftUI

struct ITDemoQuestionDescView: View {
    let viewModel: ITDemoViewModel
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
    ITDemoQuestionDescView(viewModel: ITDemoViewModel())
}
