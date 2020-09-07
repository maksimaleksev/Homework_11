//
//  AuthError.swift
//  Homework_11
//
//  Created by Maxim Alekseev on 07.09.2020.
//  Copyright © 2020 Maxim Alekseev. All rights reserved.
//

import Foundation

enum AuthError {
    case isNotFilled
    case invalidUserOrPassword
    case unknownError
}


extension AuthError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
            
        case .isNotFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .invalidUserOrPassword:
            return NSLocalizedString("Недействительный e-mail или пароль", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка", comment: "")
        }
    }
}
