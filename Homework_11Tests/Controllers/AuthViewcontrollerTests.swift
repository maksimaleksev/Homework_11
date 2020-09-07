//
//  AuthViewcontrollerTests.swift
//  Homework_11Tests
//
//  Created by Maxim Alekseev on 07.09.2020.
//  Copyright © 2020 Maxim Alekseev. All rights reserved.
//

import XCTest
@testable import Homework_11

class AuthViewcontrollerTests: XCTestCase {
    
    var sut: AuthViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: AuthViewController.self))
        sut.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    //MARK: - Views tests
    
    func testHasEmailTextfield() {
        XCTAssertTrue(sut.emailTextField.isDescendant(of: sut.view))
    }

    func testHasPasswordTextField() {
        XCTAssertTrue(sut.passwordTextField.isDescendant(of: sut.view))
    }
    
    func testHasLoginButton(){
        XCTAssertTrue(sut.loginButton.isDescendant(of: sut.view))
    }
    
    func testHasErrorLabel() {
        XCTAssertTrue(sut.errorLabel.isDescendant(of: sut.view))
    }
    
    func testErrorLabelIsHiddenWhenSignUpVCLoaded() {
        XCTAssertTrue(sut.errorLabel.isHidden)
    }
    
    func testErrorLabelIsVisibleWhenSignUpError() {
        
        sut.authErrorHasOccured(.unknownError)
        
        XCTAssertFalse(sut.errorLabel.isHidden)
        
    }
    
    func testWhenTextFieldsEmptyLoginButtonIsDisable() {
        sut.emailTextField.text = ""
        sut.passwordTextField.text = ""
        
        sut.textFieldEditedAction(sut.emailTextField)
        
        XCTAssertFalse(sut.loginButton.isEnabled)
    }

    func testWhenEmailTextFieldNotEmptyPasswordTextFieldEmptyLoginButtonIsDisable() {
        sut.emailTextField.text = "Foo"
        sut.passwordTextField.text = ""
        
        sut.textFieldEditedAction(sut.emailTextField)
        
        XCTAssertFalse(sut.loginButton.isEnabled)

    }
    
    func testWhenEmailTextFieldEmptyPasswordTextFieldNotEmptyLoginButtonIsDisable() {
        sut.emailTextField.text = ""
        sut.passwordTextField.text = "Foo"
        
        sut.textFieldEditedAction(sut.emailTextField)
        
        XCTAssertFalse(sut.loginButton.isEnabled)

    }
    
    func testWhenEmailTextFieldNotEmptyPasswordTextFieldNotEmptyLoginButtonIsDisable() {
        sut.emailTextField.text = "Foo"
        sut.passwordTextField.text = "Bar"
        
        sut.textFieldEditedAction(sut.emailTextField)
        
        XCTAssertTrue(sut.loginButton.isEnabled)

    }


    
    //MARK: - Errors messages tests
    
    func testErrorLabelTextWhenNotFilled() {
        
        sut.authErrorHasOccured(.isNotFilled)
        
        XCTAssertEqual(sut.errorLabel.text, "Заполните все поля")
    }
    
    func testErrorLabelTextWhenEmailAndPasswordInvalid() {
        sut.authErrorHasOccured(.invalidUserOrPassword)
        
        XCTAssertEqual(sut.errorLabel.text, "Недействительный e-mail или пароль")
    }
    
    func testErrorLabelTextWhenUnknownError() {
        sut.authErrorHasOccured(.unknownError)
        
        XCTAssertEqual(sut.errorLabel.text, "Неизвестная ошибка")
    }
    
    func prepareForloginButtonTappedTests() {
        let user = User(email: "foo@yandex.ru", password: "Bar")
        sut.user = user
    }
    
    func testWhenFieldsNotFilled()  {
        
        prepareForloginButtonTappedTests()
        
        sut.emailTextField.text = ""
        sut.passwordTextField.text = ""
        
        sut.loginButtonTapped(sut.loginButton)
        
        XCTAssertEqual(sut.errorLabel.text, "Заполните все поля")
    }
    
    func testWhenUserIsWrong() {
        
        prepareForloginButtonTappedTests()
        
        sut.emailTextField.text = "bar@yandex.ru"
        sut.passwordTextField.text = "Baz"
        
        sut.loginButtonTapped(sut.loginButton)
        
        XCTAssertEqual(sut.errorLabel.text, "Недействительный e-mail или пароль")
    }
     
    //MARK: - Segue tests
    
    func presentingWelcomeViewController() -> WelcomeViewController {
        sut.user = User(email: "foo@yandex.ru", password: "qazWSX1")
        sut.emailTextField.text = "foo@yandex.ru"
        sut.passwordTextField.text = "qazWSX1"
        
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = sut
        sut.loginButtonTapped(sut.loginButton)
                
        let welcomeViewController = sut.presentedViewController as! WelcomeViewController
        
        return welcomeViewController
    }
    
    func testAuthPresentsWelcomeViewController() {
        let welcomeViewController = presentingWelcomeViewController()
        XCTAssertNotNil(welcomeViewController.welcomeLabel)
    }

}
