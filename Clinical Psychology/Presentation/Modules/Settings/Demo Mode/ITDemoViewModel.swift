//
//  ITDemoViewModel.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 16.02.2025.
//

import SwiftUI

class ITDemoViewModel: ObservableObject {
    @Published var currentSession: [Question] = []
    @Published var currentStep: ITDemoStep = .welcomeMessage
    @Published var questionIndex: Int = 0
    @Published var isCorrectAnswer: Bool = false
    
    init() {
        generateSession()
    }
    
    private func generateSession() {
        if let questions = loadJSON() {
            self.currentSession = questions
        }
    }
    
    private func loadJSON() -> [Question]? {
        guard let url = Bundle.main.url(forResource: "interpretation_demo", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let questions = try? JSONDecoder().decode([Question].self, from: data) else {
            print("JSON dosyası yüklenemedi: interpretation_demo")
            return nil
        }
        return questions
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
            currentStep = .demoDescription
            
        case .demoDescription:
            currentStep = .demoQuestionDescription
            
        case .demoQuestionDescription:
            currentStep = .demoFirstQuestion
            
        case .demoFirstQuestion:
            currentStep = .demoSecondQuestion
            
        case .demoSecondQuestion:
            currentStep = .demoSecondQuestionResult
            
        case .demoSecondQuestionResult:
            if questionIndex < currentSession.count - 1 {
                questionIndex += 1
                currentStep = .demoQuestionDescription
            } else {
                currentStep = .demoFinish
            }
            
        case .demoFinish:
            break
        }
    }
}
