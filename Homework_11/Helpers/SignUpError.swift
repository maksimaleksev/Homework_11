//
//  SignUpError.swift
//  Homework_11
//
//  Created by Maxim Alekseev on 06.09.2020.
//  Copyright © 2020 Maxim Alekseev. All rights reserved.
//

import Foundation

enum SignUpError {
    case isNotFilled
    case emailIsNotValid
    case passwordsNotMatched
    case passwordIsNotValid
    case unknownError
}


extension SignUpError: LocalizedError {
    
    var errorDescription: String? {
        
        switch self {
        case .isNotFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .emailIsNotValid:
            return NSLocalizedString("Недействительный e-mail", comment: "")
        case .passwordsNotMatched:
            return NSLocalizedString("Введенные пароли не совпадают", comment: "")
        case .passwordIsNotValid:
            return NSLocalizedString("Введенный пароль не удовлетворяет критериям безопасности", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка", comment: "")
        }
    }
}
