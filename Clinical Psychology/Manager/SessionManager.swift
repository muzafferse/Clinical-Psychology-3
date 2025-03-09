//
//  SessionManager.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 27.01.2025.
//

import SwiftUICore
import FirebaseFirestore
import FirebaseAuth

extension Notification.Name {
    static let didLogin = Notification.Name("didLogin")
}

class SessionManager: ObservableObject {
    static let shared = SessionManager()
    
    private var dbName: String {
        #if CLINIC3A
        return "3A"
        #elseif CLINIC3B
        return "3B"
        #endif
    }
    var nickName: String = AppStrings.guestUser
    @Published var sessionData: SessionData
    private let db = Firestore.firestore()
    
    private var loginObserver: NSObjectProtocol?
    
    private init() {
        self.sessionData = SessionData()
        Task {
            await initializeSession()
        }
        
        loginObserver = NotificationCenter.default.addObserver(forName: .didLogin, object: nil, queue: .main) { [weak self] _ in
            Task {
                self?.sessionData = SessionData()
                await self?.initializeSession()
            }
        }
    }
    
    deinit {
            if let loginObserver = loginObserver {
                NotificationCenter.default.removeObserver(loginObserver)
            }
        }
    
    func saveSessionData() {
        let userDocRef = db.collection(dbName).document(nickName)
        let sessionKey = "Oturum-\(sessionData.sessionNumber)"
        
        let cautionTestData = sessionData.cautionTestData.map { data in
            return [
                "a. Tarih ve Saat": data.timeStamp,
                "b. Fotoğraf Çifti No": data.imagePairNo,
                "c. Nötr Fotoğraf Yeri": data.neutralPhotoPosition,
                "d. OKB Fotoğrafı Yeri": data.ocdPhotoPosition,
                "e. Okun Yönü": data.arrowDirection,
                "f. Okun Yeri": data.arrowPosition,
                "g. Verilen Yanıt": data.givenAnswer,
                "h. Yanıt Doğru Mu": data.isAnswerCorrect,
                "i. Tepki Süresi (ms)": data.responseTime
            ] as [String : Any]
        }
        
        let interpretationTestData = sessionData.interpretationTestData.map { data in
            return [
                "a. Tarih ve Saat": data.timeStamp,
                "b. Soru Açıklaması": data.questionDescription,
                "c. Tür": data.category,
                "d. Boşluklu Soru": data.firstQuestion,
                "e. Boşluklu Sorunun Cevabı": data.firstQuestionAnswer,
                "f. Boşluklu Soruya Verilen Cevap": data.givenFirstQuestionAnswer,
                "g. Tepki Süresi (Boşluk Doldurma) (ms)": data.firstQuestionResponseTime,
                "h. Soru": data.secondQuestion,
                "i. Sorunun Cevabı": data.secondQuestionAnswer,
                "j. Soruya Verilen Cevap": data.givenSecondQuestionAnswer,
                "k. Cevabın Doğru Olup Olmadığı": data.isSecondQuestionAnswerCorrect,
                "l. Geri Bildirim": data.feedback,
                "m. Tepki Süresi (ms)": data.secondQuestionResponseTime
            ] as [String : Any]
        }
        
        let sessionDataDict: [String: Any] = [
            sessionKey: createSessionValue(caution: cautionTestData, interpretation: interpretationTestData)
        ]
        
        userDocRef.setData(sessionDataDict, merge: true) { error in
            if let error = error {
                print("Error saving session data: \(error.localizedDescription)")
            } else {
                print("Session data successfully saved!")
            }
        }
        
        self.createNewSession()
    }
}

// MARK: - Init Helpers
extension SessionManager {
    private func updateNickName() async {
        self.nickName = await AuthManager.shared.user?.email?.replacingOccurrences(of: "@gmail.com", with: "") ?? AppStrings.guestUser
    }
    
    private func initializeSession() async {
        await updateNickName()
        determineNextSessionNumber { [weak self] nextSessionNumber in
            self?.sessionData = SessionData(sessionNumber: nextSessionNumber)
        }
    }
    
    func determineNextSessionNumber(completion: @escaping (Int) -> Void) {
        let userDocRef = db.collection(dbName).document(nickName)
        
        userDocRef.getDocument { document, error in
            if let error = error {
                print("Error getting sessions: \(error.localizedDescription)")
            } else if let document = document, document.exists {
                let data = document.data() ?? [:]
                let sessionNumbers = data.keys.compactMap { key -> Int? in
                    if key.hasPrefix("Oturum-") {
                        return Int(key.replacingOccurrences(of: "Oturum-", with: ""))
                    }
                    return nil
                }
                let nextSessionNumber = (sessionNumbers.max() ?? 0) + 1
                completion(nextSessionNumber)
            } else {
                userDocRef.setData([:]) { error in
                    if let error = error {
                        print("Error creating document: \(error.localizedDescription)")
                    }
                    completion(1)
                }
            }
        }
    }
    
    private func createSessionValue(caution: [[String : Any]],
                                    interpretation: [[String : Any]]) -> [String: Any] {
        #if CLINIC3A
        return [
            "a. Dikkat Yanlılığı": caution,
            "b. Yorumlama Yanlılığı": interpretation
        ]
        #elseif CLINIC3B
        return [
            "a. Yorumlama Yanlılığı": interpretation,
            "b. Dikkat Yanlılığı": caution
        ]
        #endif
    }
}

// MARK: - Data Helpers
extension SessionManager {
    func updateCautionTestData(_ data: CautionTestData) {
        sessionData.cautionTestData.append(data)
    }
    
    func updateInterpretationTestData(_ data: InterpretationTestData) {
        sessionData.interpretationTestData.append(data)
    }
    
    func createNewSession() {
        sessionData.cautionTestData.removeAll()
        sessionData.interpretationTestData.removeAll()
        determineNextSessionNumber { [weak self] nextSessionNumber in
            self?.sessionData = SessionData(sessionNumber: nextSessionNumber)
        }
    }
}
