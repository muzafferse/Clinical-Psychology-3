//
//  ITDemoSQResultView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 16.02.2025.
//

import SwiftUI

struct ITDemoSQResultView: View {
    @ObservedObject var viewModel: ITDemoViewModel
    
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
    ITDemoSQResultView(viewModel: ITDemoViewModel())
}
