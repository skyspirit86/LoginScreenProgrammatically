//
//  LoginService.swift
//  LoginScreenProgrammatically
//
//  Created by Zolt Varga on 02/06/22.
//

import Foundation

enum LoginError: Error {
    case failedToLogin
    case autoLoginFailed
}

final class LoginService {
    
    // Simulate the state. Like AutoLogin
    func isLogedIn(_ completion: @escaping (Result<Bool, LoginError>) -> Void) {
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when, execute: {
            completion(.success(true))
        })
    }
    
    // Simulate Network Request for login
    func logIn(_ completion: @escaping (Result<Bool, LoginError>) -> Void) {
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when, execute: {
            completion(.success(true))
        })
    }
}

// MARK: - Helper
extension LoginService {
    func validateUserName(_ username: String) -> Bool {
        if username.count >= 8 { // Some regex validation in case of mail, etc
            return true
        }
        return false
    }
    
    func validatePassword(_ password: String) -> Bool {
        if password.count >= 8 { // Some regex that user used at least 1 Capital letter etc
            return true
        }
        return false
    }
}
