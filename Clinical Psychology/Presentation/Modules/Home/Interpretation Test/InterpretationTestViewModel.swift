//
//  InterpretationTestViewModel.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 15.05.2024.
//

import SwiftUI

class InterpretationTestViewModel: ObservableObject {
    @Published var questions: [InterpretationCategory] = []
    @Published var currentSession: [Question] = []
    @Published var currentStep: ITStep = .welcomeMessage
    @Published var questionIndex: Int = 0
    @Published var isCorrectAnswer: Bool = false
    
    private var itSessionManager: ITSessionManager?
    private var questionData: InterpretationTestData?
    
    init() {
        generateSession()
    }
    
    private func generateSession() {
        if let categories = loadJSON() {
            self.questions = categories
            self.itSessionManager = ITSessionManager(categories: categories)
            
            if let manager = itSessionManager {
                self.currentSession = manager.generateSession()
            }
        }
    }
    
    private func loadJSON() -> [InterpretationCategory]? {
        guard let url = Bundle.main.url(forResource: "interpretation_all", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let categories = try? JSONDecoder().decode([InterpretationCategory].self, from: data) else {
            print("JSON dosyası yüklenemedi: interpretation_all")
            return nil
        }
        return categories
    }
    
    func getCurrentQuestion() -> Question? {
        guard questionIndex < currentSession.count else {
            return nil
        }
        return currentSession[questionIndex]
    }
    
    func updateAnswer(isCorrect: Bool) {
        isCorrectAnswer = isCorrect
    }
    
    func nextStep() {
        switch currentStep {
        case .welcomeMessage:
            currentStep = .sessionDescription
            
        case .sessionDescription:
            currentStep = .questionDescription
            
        case .questionDescription:
            currentStep = .firstQuestion
            
        case .firstQuestion:
            currentStep = .secondQuestion
            
        case .secondQuestion:
            currentStep = .secondQuestionResult
            
        case .secondQuestionResult:
            if questionIndex < currentSession.count - 1 {
                questionIndex += 1
                currentStep = .questionDescription
            } else {
                currentStep = .sessionFinish
            }
            
        case .sessionFinish:
            break
        }
    }
}

// MARK: - Firestore Helpers
extension InterpretationTestViewModel {
    func initializeCurrentQuestionData() {
        guard let currentQuestion = getCurrentQuestion() else { return }
        questionData = InterpretationTestData(
            timeStamp: Date().toDateAndTime(),
            questionDescription: currentQuestion.questionDescription,
            category: itSessionManager?.findCategory(for: currentQuestion) ?? currentQuestion.firstQuestion,
            firstQuestion: currentQuestion.firstQuestion,
            firstQuestionAnswer: currentQuestion.firstQuestionAnswer,
            givenFirstQuestionAnswer: "",
            firstQuestionResponseTime: 0,
            secondQuestion: currentQuestion.secondQuestion,
            secondQuestionAnswer: currentQuestion.secondQuestionAnswer.rawValue,
            givenSecondQuestionAnswer: "",
            isSecondQuestionAnswerCorrect: "",
            feedback: "",
            secondQuestionResponseTime: 0
        )
    }
    
    func updateFirstQuestionData(givenAnswer: String, responseTime: Int) {
        questionData?.givenFirstQuestionAnswer = givenAnswer
        questionData?.firstQuestionResponseTime = responseTime
    }
    
    func updateSecondQuestionData(givenAnswer: String, isCorrect: Bool, responseTime: Int) {
        questionData?.givenSecondQuestionAnswer = givenAnswer
        questionData?.isSecondQuestionAnswerCorrect = getFeedback(isCorrect)
        questionData?.feedback = getFeedback(isCorrect)
        questionData?.secondQuestionResponseTime = responseTime
        
        if let data = questionData {
            SessionManager.shared.updateInterpretationTestData(data)
        }
    }
    
    private func getFeedback(_ isCorrect: Bool) -> String {
        return isCorrect ? AppStrings.itCorrect : AppStrings.itIncorrect
    }
}
