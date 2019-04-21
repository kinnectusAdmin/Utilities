//
//  ValidationType.swift
//  Utilities
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
enum Validation {
    case name(info: String)
    case email(info: String)
    case password(info: String)
    
    static func validateCredentials(validations: Validation...) -> Bool {
        do {
            var isValidated: Bool = true
            for validation in validations {
                switch validation {
                case .email(let email):
                    let regexPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
                    let regex = try NSRegularExpression(pattern: regexPattern, options: .caseInsensitive)
                    let matches = regex.numberOfMatches(in: email, options: [], range: NSRange(location: 0, length: email.count))
                    let emailIsValid = matches > 0
                    isValidated = isValidated && emailIsValid
                case .name(let name):
                    let nameIsValid = !name.isEmpty
                    isValidated = isValidated && nameIsValid
                case .password(let password):
                    let passwordIsValid = password.count > 5
                    isValidated =  isValidated && passwordIsValid
                }
            }
            return isValidated
        } catch {
            assertionFailure()
        }
        return false
    }
}

