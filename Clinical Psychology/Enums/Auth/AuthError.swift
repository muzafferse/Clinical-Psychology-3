//
//  AuthError.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 18.08.2024.
//

import Foundation
import FirebaseAuth

enum AuthError: Error, LocalizedError {
    case invalidCredential
    case emailAlreadyInUse
    case invalidEmail
    case weakPassword
    case wrongPassword
    case userNotFound
    case userDisabled
    case tooManyRequests
    case operationNotAllowed
    case networkError
    case unknownError
    
    init(error: NSError) {
        switch error.code {
        case AuthErrorCode.invalidCredential.rawValue:
            self = .invalidCredential
        case AuthErrorCode.emailAlreadyInUse.rawValue:
            self = .emailAlreadyInUse
        case AuthErrorCode.invalidEmail.rawValue:
            self = .invalidEmail
        case AuthErrorCode.weakPassword.rawValue:
            self = .weakPassword
        case AuthErrorCode.wrongPassword.rawValue:
            self = .wrongPassword
        case AuthErrorCode.userNotFound.rawValue:
            self = .userNotFound
        case AuthErrorCode.userDisabled.rawValue:
            self = .userDisabled
        case AuthErrorCode.tooManyRequests.rawValue:
            self = .tooManyRequests
        case AuthErrorCode.operationNotAllowed.rawValue:
            self = .operationNotAllowed
        case AuthErrorCode.networkError.rawValue:
            self = .networkError
        default:
            self = .unknownError
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .invalidCredential:
            return AppStrings.authErrorInvalidCredential
        case .emailAlreadyInUse:
            return AppStrings.authErrorEmailAlreadyInUse
        case .invalidEmail:
            return AppStrings.authErrorInvalidEmail
        case .weakPassword:
            return AppStrings.authErrorWeakPassword
        case .wrongPassword:
            return AppStrings.authErrorWrongPassword
        case .userNotFound:
            return AppStrings.authErrorUserNotFound
        case .userDisabled:
            return AppStrings.authErrorUserDisabled
        case .tooManyRequests:
            return AppStrings.authErrorTooManyRequests
        case .operationNotAllowed:
            return AppStrings.authErrorOperationNotAllowed
        case .networkError:
            return AppStrings.authErrorNetworkError
        case .unknownError:
            return AppStrings.authErrorUnknownError
        }
    }
}
