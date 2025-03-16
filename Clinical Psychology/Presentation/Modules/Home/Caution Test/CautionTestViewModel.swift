//
//  CautionTestViewModel.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import SwiftUI

class CautionTestViewModel: ObservableObject {
    @Published var currentTrialIndex = 0
    @Published var totalTrials: [TrialItem] = []
    
    private var currentQuestionData: CautionTestData?
    
    var currentTrial: TrialItem {
        return totalTrials[currentTrialIndex]
    }
    
    init() {
        let shuffledTrials = createTrials().shuffled()
        totalTrials.append(contentsOf: shuffledTrials)
    }
    
    private func createTrials() -> [TrialItem] {
        let ocdPhotos = (1...12).map { CTImage(name: "OCB-\($0)") }
        let neutralPhotos = (1...12).map { CTImage(name: "Neutral-\($0)") }
        var trialPairs: [TrialItem] = []
        
        for i in 0..<12 {
            for position in Position.allCases {
                for direction in Direction.allCases {
                    for arrowType in ArrowImageType.allCases {
                        let trialItem = TrialItem(ocdImage: ocdPhotos[i],
                                                  neutralImage: neutralPhotos[i],
                                                  direction: direction,
                                                  position: position,
                                                  imageType: arrowType)
                        trialPairs.append(trialItem)
                    }
                }
            }
        }
        return trialPairs
    }
}

// MARK: - Firestore Helpers
extension CautionTestViewModel {
    func initializeCurrentQuestionData() {
        currentQuestionData = CautionTestData(timeStamp: Date().toDateAndTime(),
                                              imagePairNo: getPairNumber(),
                                              neutralPhotoPosition: currentTrial.position.rawValue,
                                              ocdPhotoPosition: currentTrial.position.reversed.rawValue,
                                              arrowDirection: currentTrial.direction.rawValue,
                                              arrowPosition: getArrowPosition(),
                                              givenAnswer: "",
                                              isAnswerCorrect: "",
                                              responseTime: 0)
    }
    
    func updateQuestionData(givenAnswer: String, responseTime: Int) {
        currentQuestionData?.givenAnswer = givenAnswer
        currentQuestionData?.isAnswerCorrect = getFeedback(givenAnswer)
        currentQuestionData?.responseTime = responseTime
        
        if let data = currentQuestionData {
            SessionManager.shared.updateCautionTestData(data)
        }
    }
    
    private func getPairNumber() -> String {
        guard let numberItem = currentTrial.ocdImage.name.split(separator: "-").last else {
            return ""
        }
        return "Çift" + numberItem + "_Müdahale"
    }
    
    private func getArrowPosition() -> String {
        if currentTrial.imageType == .neutral {
            return currentTrial.position.rawValue
        } else {
            return currentTrial.position.reversed.rawValue
        }
    }
    
    private func getFeedback(_ givenAnswer: String) -> String {
        return currentTrial.direction.rawValue == givenAnswer ? AppStrings.itCorrect : AppStrings.itIncorrect
    }
}
