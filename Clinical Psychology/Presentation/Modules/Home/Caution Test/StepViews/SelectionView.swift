//
//  SelectionView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct SelectionView: View {
    let viewModel: CautionTestViewModel
    let onSelection: (String, Int) -> Void
    
    @State private var startTime: Date?
    @State private var isButtonDisabled = false
    
    var body: some View {
        let trial = viewModel.currentTrial
        ZStack {
            VStack(spacing: 32) {
                if trial.position == .topNeutral {
                    arrowFrameView(direction: trial.direction)
                    
                    Spacer()
                        .frame(width: 256, height: 192)
                } else {
                    Spacer()
                        .frame(width: 256, height: 192)
                    
                    arrowFrameView(direction: trial.direction)
                }
            }
            
            selectionButtonsView()
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
    
    private func arrowFrameView(direction: ArrowDirection) -> some View {
        ZStack {
            Spacer().frame(width: 256, height: 192)
            VStack {
                if direction == .right {
                    Image.rightArrowIcon
                        .regularTextStyle(size: 32)
                } else {
                    Image.leftArrowIcon
                        .regularTextStyle(size: 32)
                }
            }
        }
    }
    
    private func selectionButtonsView() -> some View {
        HStack {
            Button(action: {
                handleSelection(givenAnswer: .left)
            }, label: {
                Image.leftArrowIcon
            })
            .frame(width: 64, height: 32)
            .primaryActiveButtonStyle()
            .disabled(isButtonDisabled)
            
            Spacer()
            
            Button(action: {
                handleSelection(givenAnswer: .right)
            }, label: {
                Image.rightArrowIcon
            })
            .frame(width: 64, height: 32)
            .primaryActiveButtonStyle()
            .disabled(isButtonDisabled)
        }
    }
    
    private func handleSelection(givenAnswer: ArrowDirection) {
        isButtonDisabled = true
        if let startTime = startTime {
            let responseTime = Int(Date().timeIntervalSince(startTime) * 1000)
            onSelection(givenAnswer.rawValue, responseTime)
        }
    }
}

#Preview {
    SelectionView(viewModel: CautionTestViewModel(),
                  onSelection: { _,_ in })
}
