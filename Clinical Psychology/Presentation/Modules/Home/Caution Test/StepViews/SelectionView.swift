//
//  SelectionView.swift
//  Clinical Psychology 3
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
            arrowFrameView(direction: trial.direction,
                           imageType: trial.imageType,
                           position: trial.position)
            
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
    
    private func arrowFrameView(direction: Direction,
                                imageType: ArrowImageType,
                                position: Position) -> some View {
        
        let isArrowOnTop: Bool = {
            switch position {
            case .top:
                return imageType == .neutral
            case .bottom:
                return imageType == .ocd
            }
        }()
        
        return VStack {
            let isRight = direction == .right
            if isArrowOnTop {
                if isRight {
                    Image.rightArrowIcon
                        .regularTextStyle(size: 32)
                } else {
                    Image.leftArrowIcon
                        .regularTextStyle(size: 32)
                }
                
                Spacer()
                    .frame(width: 256, height: 192)
            } else {
                Spacer()
                    .frame(width: 256, height: 192)
                
                if isRight {
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
    
    private func handleSelection(givenAnswer: Direction) {
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
