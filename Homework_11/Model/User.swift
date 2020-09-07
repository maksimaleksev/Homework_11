//
//  User.swift
//  Homework_11
//
//  Created by Maxim Alekseev on 06.09.2020.
//  Copyright © 2020 Maxim Alekseev. All rights reserved.
//

import Foundation

struct User {
    
    var email: String
    var password: String
    
}

extension User: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.email == rhs.email && lhs.password == rhs.password
    }
}
