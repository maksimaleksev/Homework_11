//
//  ValidatorsTests.swift
//  Homework_11Tests
//
//  Created by Maxim Alekseev on 05.09.2020.
//  Copyright © 2020 Maxim Alekseev. All rights reserved.
//

import XCTest
@testable import Homework_11

class ValidatorsTests: XCTestCase {
    
    var sut: Validator!
    
    //Var when email password and confirm password are not filled
    var whenIsNotFilled: Bool!
    
    //Var when email password and confirm password are filled
    var whenIsFilled: Bool!
    
    //Var when email is not filled
    var whenEmailIsNotFilled: Bool!
    
    //Var when password is not filled
    var whenPasswordIsNotFilled: Bool!
    
    //Var when repeat password is not filled
    var whenRepeatPasswordIsNotFilled: Bool!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Validator.shared
    }
    
    override func tearDownWithError() throws {
        sut = nil
        whenIsNotFilled = nil
        whenIsFilled = nil
        whenEmailIsNotFilled = nil
        whenPasswordIsNotFilled = nil
        whenRepeatPasswordIsNotFilled = nil
        
        try super.tearDownWithError()
    }
    
    // Init properties for isFilled test for SignUpViewController
    
    func prepareIsFilledForSignupTest() {
        
        let emptyEmail = ""
        let emptyPassword = ""
        let emptyRepeatPassword = ""
        let fullFillEmail = "foo@bar.ru"
        let fullFillPassword = "Baz"
        let fullFillRepeatPasword = "Baz"
        
        whenIsNotFilled = sut.isFilled(email: emptyEmail, password: emptyPassword, repeatPassword: emptyRepeatPassword)
        
        whenIsFilled = sut.isFilled(email: fullFillEmail, password: fullFillPassword, repeatPassword: fullFillRepeatPasword)
        
        whenEmailIsNotFilled = sut.isFilled(email: emptyEmail, password: fullFillPassword, repeatPassword: fullFillRepeatPasword)
        
        whenPasswordIsNotFilled = sut.isFilled(email: fullFillEmail, password: emptyPassword, repeatPassword: fullFillRepeatPasword)
        
        whenRepeatPasswordIsNotFilled = sut.isFilled(email: fullFillEmail, password: fullFillPassword, repeatPassword: emptyRepeatPassword)
    }
    
    // Init properties for isFilled test for SignUpViewController
    
    func prepareIsFilledForAuthTest() {
        whenIsNotFilled = sut.isFilled(email: "", password: "")
        whenEmailIsNotFilled = sut.isFilled(email: "", password: "Foo")
        whenPasswordIsNotFilled = sut.isFilled(email: "foo@bar.com", password: "")
        whenIsFilled = sut.isFilled(email: "foo@bar.com", password: "Baz")
    }
    
    func testIsFilledWhenSignup() {
        
        prepareIsFilledForSignupTest()
        
        //Test when email password and confirm password are not filled
        XCTAssertFalse(whenIsNotFilled)
        
        //Test when email password and confirm password are filled
        XCTAssertTrue(whenIsFilled)
        
        //Test when email is not filled
        XCTAssertFalse(whenEmailIsNotFilled)
        
        //Test when password is not filled
        XCTAssertFalse(whenPasswordIsNotFilled)
        
        //Test when repeat password is not filled
        XCTAssertFalse(whenRepeatPasswordIsNotFilled)
    }
    
    func testIsFilledWhenAuth() {
        prepareIsFilledForAuthTest()
        
        //Test when email and password are not filled
        XCTAssertFalse(whenIsNotFilled)
        
        //Test when email is not filled
        XCTAssertFalse(whenEmailIsNotFilled)
        
        //Test when email is not filled
        XCTAssertFalse(whenPasswordIsNotFilled)
        
        //Test when email password and confirm password are filled
        XCTAssertTrue(whenIsFilled)
    }
    
    func testIsValidEmail() {
        
        let email1 = "foo@bar"
        let email2 = "xzxcvd"
        let email3 = "vw@asdd"
        let email4 = "@asfdsk"
        let email5 = "baz@mail.ru"
        let email6 = "mofksols@yahoo.com"
        let email7 = "dfq_sa@dfk.net"
        let email8 = "203lls@sw12.eu"
        
        //Wrong email tests
        XCTAssertFalse(sut.isValidEmail(email1))
        XCTAssertFalse(sut.isValidEmail(email2))
        XCTAssertFalse(sut.isValidEmail(email3))
        XCTAssertFalse(sut.isValidEmail(email4))
        
        //Right email tests
        XCTAssertTrue(sut.isValidEmail(email5))
        XCTAssertTrue(sut.isValidEmail(email6))
        XCTAssertTrue(sut.isValidEmail(email7))
        XCTAssertTrue(sut.isValidEmail(email8))
        
    }
    
    func testIsValidPassword() {
        
        let password1 = "123456"
        let password2 = "abcdef"
        let password3 = "ABCDEF"
        let password4 = "qaz1X"
        let password5 = "qazwsX1"
        let password6 = "Abcdef14"
        let password7 = "1234aB"
        let password8 = "ABCDEFg1"
        
        //Wrong passwords tests section
        XCTAssertFalse(sut.isValidPassword(password1))
        XCTAssertFalse(sut.isValidPassword(password2))
        XCTAssertFalse(sut.isValidPassword(password3))
        XCTAssertFalse(sut.isValidPassword(password4))
        
        //Right passwords tests section
        XCTAssertTrue(sut.isValidPassword(password5))
        XCTAssertTrue(sut.isValidPassword(password6))
        XCTAssertTrue(sut.isValidPassword(password7))
        XCTAssertTrue(sut.isValidPassword(password8))
    }
}
