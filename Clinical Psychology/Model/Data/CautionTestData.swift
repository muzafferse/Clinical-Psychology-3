//
//  CautionTestData.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 27.01.2025.
//

import SwiftUI

struct CautionTestData: Codable {
    let timeStamp: String
    let imagePairNo: String
    let neutralPhotoPosition: String
    let ocdPhotoPosition: String
    let arrowDirection: String
    let arrowPosition: String
    var givenAnswer: String
    var isAnswerCorrect: String
    var responseTime: Int
}
