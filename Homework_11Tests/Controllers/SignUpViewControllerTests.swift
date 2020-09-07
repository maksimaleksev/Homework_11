//
//  SignUpViewControllerTests.swift
//  Homework_11Tests
//
//  Created by Maxim Alekseev on 05.09.2020.
//  Copyright © 2020 Maxim Alekseev. All rights reserved.
//

import XCTest
@testable import Homework_11

class SignUpViewControllerTests: XCTestCase {
    
    var sut: SignUpViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: SignUpViewController.self))
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
    
    func testHasRepeatPasswordTextField() {
        XCTAssertTrue(sut.repeatPasswordTextField.isDescendant(of: sut.view))
    }
    
    func testHasSigupButton(){
        XCTAssertTrue(sut.signUpButton.isDescendant(of: sut.view))
    }
    
    func testHasErrorLabel() {
        XCTAssertTrue(sut.errorLabel.isDescendant(of: sut.view))
    }
    
    func testErrorLabelIsHiddenWhenSignUpVCLoaded() {
        XCTAssertTrue(sut.errorLabel.isHidden)
    }
    
    func testErrorLabelIsVisibleWhenSignUpError() {
        
        sut.signUpErrorHasOccured(.unknownError)
        
        XCTAssertFalse(sut.errorLabel.isHidden)
        
    }
    
    //MARK: - Errors messages tests
    
    func testErrorLabelTextWhenNotFilled() {
        
        sut.signUpErrorHasOccured(.isNotFilled)
        
        XCTAssertEqual(sut.errorLabel.text, "Заполните все поля")
    }
    
    func testErrorLabelTextWhenEmailNotValid() {
        
        sut.signUpErrorHasOccured(.emailIsNotValid)
        
        XCTAssertEqual(sut.errorLabel.text, "Недействительный e-mail")
    }
    
    func testErrorLabelTextWhenPasswordsNotMatched() {
        
        sut.signUpErrorHasOccured(.passwordsNotMatched)
        
        XCTAssertEqual(sut.errorLabel.text, "Введенные пароли не совпадают")
    }
    
    func testErrorLabelTextWhenPasswordNotValid() {
        
        sut.signUpErrorHasOccured(.passwordIsNotValid)
        
        XCTAssertEqual(sut.errorLabel.text, "Введенный пароль не удовлетворяет критериям безопасности")
    }
    
    func testErrorLabelTextWhenUnknownError() {
        
        sut.signUpErrorHasOccured(.unknownError)
        
        XCTAssertEqual(sut.errorLabel.text, "Неизвестная ошибка")
    }
    
    func testWhenFieldsNotFilled()  {
        
        sut.emailTextField.text = ""
        sut.passwordTextField.text = ""
        sut.repeatPasswordTextField.text = ""
        
        sut.signupButtonTapped(sut.signUpButton)
        
        
        XCTAssertEqual(sut.errorLabel.text, "Заполните все поля")
    }
    
    func testWhenEmailIsNotValid() {
        sut.emailTextField.text = "foo"
        sut.passwordTextField.text = "bar"
        sut.repeatPasswordTextField.text = "baz"
        
        sut.signupButtonTapped(sut.signUpButton)
        
        XCTAssertEqual(sut.errorLabel.text, "Недействительный e-mail")
    }
    
    func testWhenPasswordsNotMatched() {
        
        sut.emailTextField.text = "foo@yandex.ru"
        sut.passwordTextField.text = "bar"
        sut.repeatPasswordTextField.text = "baz"
        
        sut.signupButtonTapped(sut.signUpButton)
        
        XCTAssertEqual(sut.errorLabel.text, "Введенные пароли не совпадают")
    }
    
    func testWhenPasswordIsNotValid() {
        
        sut.emailTextField.text = "foo@yandex.ru"
        sut.passwordTextField.text = "bar"
        sut.repeatPasswordTextField.text = "bar"
        
        sut.signupButtonTapped(sut.signUpButton)
        
        XCTAssertEqual(sut.errorLabel.text, "Введенный пароль не удовлетворяет критериям безопасности")
        
    }
    
    //MARK: - Tests when signup successed
    
    func testUserNotNilWhenSuccess() {
        
        sut.emailTextField.text = "foo@yandex.ru"
        sut.passwordTextField.text = "barBar1"
        sut.repeatPasswordTextField.text = "barBar1"
        
        sut.signupButtonTapped(sut.signUpButton)
        
        XCTAssertNotNil(sut.user)
        
    }
    
    func testCreatedUserEqualEnteredUser() {
        
        sut.emailTextField.text = "foo@yandex.ru"
        sut.passwordTextField.text = "barBar1"
        sut.repeatPasswordTextField.text = "barBar1"
        
        let enteredUser = User(email: sut.emailTextField.text!, password: sut.passwordTextField.text!)
        
        sut.signupButtonTapped(sut.signUpButton)
        
        XCTAssertEqual(sut.user, enteredUser)
    }
    
    
    //MARK: - Segue tests
    
    func presentingAuthViewController() -> AuthViewController {
        
        sut.emailTextField.text = "foo@yandex.ru"
        sut.passwordTextField.text = "barBar1"
        sut.repeatPasswordTextField.text = "barBar1"


        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = sut
        
        sut.signupButtonTapped(sut.signUpButton)

        let authViewController = sut.presentedViewController as! AuthViewController

        return authViewController
    }

    func testAuthPresentsWelcomeViewController() {
        let authViewController = presentingAuthViewController()
        XCTAssertNotNil(authViewController.emailTextField)
    }
    
    func testSignUpVCUserEqualAuthVCUser() {
        let authViewController = presentingAuthViewController()
        XCTAssertEqual(sut.user, authViewController.user)
    }    
}

