//
//  AuthViewController.swift
//  Homework_11
//
//  Created by Maxim Alekseev on 06.09.2020.
//  Copyright © 2020 Maxim Alekseev. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    var user: User!
    private var validator = Validator()
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func textFieldEditedAction(_ sender: UITextField) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        if email.count > 0 && password.count > 0 {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton!) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        guard validator.isFilled(email: email, password: password) else {
            authErrorHasOccured(.isNotFilled)
            return
        }
        
        let enteredUser = User(email: email, password: password)
        
        if enteredUser == user {
            performSegue(withIdentifier: String(describing: WelcomeViewController.self), sender: sender)
        } else {
            authErrorHasOccured(.invalidUserOrPassword)
        }
    }
    
}

extension AuthViewController {
    
    func authErrorHasOccured(_ error: AuthError) {
        errorLabel.isHidden = false
        errorLabel.text = error.errorDescription
    }
}
