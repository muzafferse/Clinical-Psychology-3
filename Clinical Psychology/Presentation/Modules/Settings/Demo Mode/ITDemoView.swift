//
//  ITDemoView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 16.02.2025.
//

import SwiftUI

struct ITDemoView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel = ITDemoViewModel()
    @State private var answer: String = ""
    
    var body: some View {
        VStack {
            switch viewModel.currentStep {
            case .welcomeMessage:
                ITWelcomeView() {
                    viewModel.nextStep()
                }
                
            case .demoDescription:
                ITDemoDescriptionView() {
                    viewModel.nextStep()
                }
            
            case .demoQuestionDescription:
                ITDemoQuestionDescView(viewModel: viewModel)
                
            case .demoFirstQuestion:
                ITDemoFirstQuestionView(viewModel: viewModel, answer: $answer)
                
            case .demoSecondQuestion:
                ITDemoSecondQuestionView(viewModel: viewModel) { isCorrect in
                    viewModel.updateAnswer(isCorrect: isCorrect)
                    viewModel.nextStep()
                }
                
            case .demoSecondQuestionResult:
                ITDemoSQResultView(viewModel: viewModel)
                
            case .demoFinish:
                ITDemoFinishView() {
                    appState.settingsNavigation = .init()
                }
            }
        }
        .padding(.horizontal, 24)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ITDemoView()
}

