//
//  InterpretationTestView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 15.05.2024.
//

import SwiftUI

struct InterpretationTestView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel = InterpretationTestViewModel()
    @State private var answer: String = ""
    
    var body: some View {
        VStack {
            switch viewModel.currentStep {
            case .welcomeMessage:
                ITWelcomeView() {
                    viewModel.nextStep()
                }
                
            case .sessionDescription:
                ITSessionDescriptionView() {
                    viewModel.nextStep()
                }
                
            case .questionDescription:
                ITQuestionDescriptionView(viewModel: viewModel)
                
            case .firstQuestion:
                ITFirstQuestionView(viewModel: viewModel, answer: $answer)
                
            case .secondQuestion:
                ITSecondQuestionView(viewModel: viewModel) { isCorrect in
                    viewModel.updateAnswer(isCorrect: isCorrect)
                    viewModel.nextStep()
                }
                
            case .secondQuestionResult:
                ITSecondQuestionResultView(viewModel: viewModel)
                
            case .sessionFinish:
                ITSessionFinishView() {
                    #if CLINIC1A
                    SessionManager.shared.saveSessionData()
                    appState.homeNavigation = .init()
                    #else
                    self.appState.homeNavigation.append(HomeNavDestination.cautionTest)
                    #endif
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
    InterpretationTestView()
}
