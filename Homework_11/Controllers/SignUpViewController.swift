//
//  SignUpViewController.swift
//  Homework_11
//
//  Created by Maxim Alekseev on 04.09.2020.
//  Copyright © 2020 Maxim Alekseev. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private var validator = Validator.shared
    var user: User?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text, let repeatPassword = repeatPasswordTextField.text else { return }
        
        guard validator.isFilled(email: email, password: password, repeatPassword: repeatPassword)
            else {
                signUpErrorHasOccured(.isNotFilled)
                return
        }
        
        guard validator.isValidEmail(email) else {
            signUpErrorHasOccured(.emailIsNotValid)
            return
        }
        
        guard password == repeatPassword else {
            signUpErrorHasOccured(.passwordsNotMatched)
            return
        }
        
        guard validator.isValidPassword(password) else {
            signUpErrorHasOccured(.passwordIsNotValid)
            return
        }
        
        user = User(email: email, password: password)
        performSegue(withIdentifier: String(describing: AuthViewController.self), sender: sender)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let authVC = segue.destination as? AuthViewController else { return }
        authVC.user = user
    }
    
}

//MARK: - Show error when error occured

extension SignUpViewController {
    
    func signUpErrorHasOccured(_ error: SignUpError) {
        errorLabel.isHidden = false
        errorLabel.text = error.errorDescription
    }
    
}
