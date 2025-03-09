//
//  SessionData.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 27.01.2025.
//

import SwiftUI

struct SessionData: Codable {
    var sessionNumber: Int
    var cautionTestData: [CautionTestData]
    var interpretationTestData: [InterpretationTestData]
    
    init(sessionNumber: Int = -1,
         cautionTestData: [CautionTestData] = [],
         interpretationTestData: [InterpretationTestData] = []) {
        self.sessionNumber = sessionNumber
        self.cautionTestData = cautionTestData
        self.interpretationTestData = interpretationTestData
    }
}
