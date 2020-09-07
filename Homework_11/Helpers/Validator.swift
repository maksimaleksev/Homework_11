//
//  Validator.swift
//  Homework_11
//
//  Created by Maxim Alekseev on 05.09.2020.
//  Copyright © 2020 Maxim Alekseev. All rights reserved.
//

import Foundation

class Validator {
    
    static let shared = Validator()
    
    // Check filled textfields in SignUpViewController
    func isFilled(email: String?, password: String?, repeatPassword: String?) -> Bool {
        
        guard let email = email,
            let password = password,
            let repeatPassword = repeatPassword,
            email  != "",
            password != "",
            repeatPassword != ""
            else { return false }
        
        return true
        
    }
    
    //Check filled textfields in AuthViewController
    
    func isFilled(email: String?, password: String?) -> Bool {
        
        guard let email = email,
        let password = password,
        email != "",
        password != ""
        else { return false }
        return true
        
    }
    
    func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else { return false }
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    func isValidPassword(_ password: String?) -> Bool {
        guard let password = password else { return false }
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"
        return check(text: password, regEx: passwordRegex)
    }
    
    private func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}
