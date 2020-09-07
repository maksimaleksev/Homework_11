//
//  Homework_11UITests.swift
//  Homework_11UITests
//
//  Created by Maxim Alekseev on 04.09.2020.
//  Copyright © 2020 Maxim Alekseev. All rights reserved.
//

import XCTest

class Homework_11UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpVCErrorNotFilled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        app.textFields["Введите e-mail"].tap()
        app.secureTextFields["Введите пароль"].tap()
        app.secureTextFields["Повторите пароль"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Зарегистрироваться"]/*[[".buttons[\"Зарегистрироваться\"].staticTexts[\"Зарегистрироваться\"]",".staticTexts[\"Зарегистрироваться\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSignUpVCErrorWhenPasswordNotValid() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.textFields["Введите e-mail"].tap()
        app.textFields["Введите e-mail"].typeText("foo@yandex.ru")
        app.secureTextFields["Введите пароль"].tap()
        app.secureTextFields["Введите пароль"].typeText("qaz")
        app.secureTextFields["Повторите пароль"].tap()
        app.secureTextFields["Повторите пароль"].typeText("qaz")
        app/*@START_MENU_TOKEN@*/.staticTexts["Зарегистрироваться"]/*[[".buttons[\"Зарегистрироваться\"].staticTexts[\"Зарегистрироваться\"]",".staticTexts[\"Зарегистрироваться\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testSignUpVCErrorWhenEmailNotValid() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Введите e-mail"].tap()
        app.textFields["Введите e-mail"].typeText("foo@")
        app.secureTextFields["Введите пароль"].tap()
        app.secureTextFields["Введите пароль"].typeText("qazXSW1")
        app.secureTextFields["Повторите пароль"].tap()
        app.secureTextFields["Повторите пароль"].typeText("qazXSW1")
        app/*@START_MENU_TOKEN@*/.staticTexts["Зарегистрироваться"]/*[[".buttons[\"Зарегистрироваться\"].staticTexts[\"Зарегистрироваться\"]",".staticTexts[\"Зарегистрироваться\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }

    func testSignUPVCSuccessSignUp() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Введите e-mail"].tap()
        app.textFields["Введите e-mail"].typeText("foo@yandex.ru")
        app.secureTextFields["Введите пароль"].tap()
        app.secureTextFields["Введите пароль"].typeText("qazXSW1")
        app.secureTextFields["Повторите пароль"].tap()
        app.secureTextFields["Повторите пароль"].typeText("qazXSW1")
        app/*@START_MENU_TOKEN@*/.staticTexts["Зарегистрироваться"]/*[[".buttons[\"Зарегистрироваться\"].staticTexts[\"Зарегистрироваться\"]",".staticTexts[\"Зарегистрироваться\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testAuthVCSuccessAuth() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Введите e-mail"].tap()
        app.textFields["Введите e-mail"].typeText("foo@yandex.ru")
        app.secureTextFields["Введите пароль"].tap()
        app.secureTextFields["Введите пароль"].typeText("qazXSW1")
        app.secureTextFields["Повторите пароль"].tap()
        app.secureTextFields["Повторите пароль"].typeText("qazXSW1")
        app/*@START_MENU_TOKEN@*/.staticTexts["Зарегистрироваться"]/*[[".buttons[\"Зарегистрироваться\"].staticTexts[\"Зарегистрироваться\"]",".staticTexts[\"Зарегистрироваться\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Введите e-mail"].tap()
        app.textFields["Введите e-mail"].typeText("foo@yandex.ru")
        app.secureTextFields["Введите пароль"].tap()
        app.secureTextFields["Введите пароль"].typeText("qazXSW1")
        app.buttons["Авторизироваться"].tap()
    }
    
    func testAuthVCErrorPasswordAuth() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Введите e-mail"].tap()
        app.textFields["Введите e-mail"].typeText("foo@yandex.ru")
        app.secureTextFields["Введите пароль"].tap()
        app.secureTextFields["Введите пароль"].typeText("qazXSW1")
        app.secureTextFields["Повторите пароль"].tap()
        app.secureTextFields["Повторите пароль"].typeText("qazXSW1")
        app/*@START_MENU_TOKEN@*/.staticTexts["Зарегистрироваться"]/*[[".buttons[\"Зарегистрироваться\"].staticTexts[\"Зарегистрироваться\"]",".staticTexts[\"Зарегистрироваться\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Введите e-mail"].tap()
        app.textFields["Введите e-mail"].typeText("foo@yandex.ru")
        app.secureTextFields["Введите пароль"].tap()
        app.secureTextFields["Введите пароль"].typeText("qazXSW")
        app.buttons["Авторизироваться"].tap()
    }
    
    func testAuthVCErrorEmailAuth() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Введите e-mail"].tap()
        app.textFields["Введите e-mail"].typeText("foo@yandex.ru")
        app.secureTextFields["Введите пароль"].tap()
        app.secureTextFields["Введите пароль"].typeText("qazXSW1")
        app.secureTextFields["Повторите пароль"].tap()
        app.secureTextFields["Повторите пароль"].typeText("qazXSW1")
        app/*@START_MENU_TOKEN@*/.staticTexts["Зарегистрироваться"]/*[[".buttons[\"Зарегистрироваться\"].staticTexts[\"Зарегистрироваться\"]",".staticTexts[\"Зарегистрироваться\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Введите e-mail"].tap()
        app.textFields["Введите e-mail"].typeText("foo@yandex")
        app.secureTextFields["Введите пароль"].tap()
        app.secureTextFields["Введите пароль"].typeText("qazXSW")
        app.buttons["Авторизироваться"].tap()
    }
    
    func testAuthVCErrorNotFilled() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Введите e-mail"].tap()
        app.textFields["Введите e-mail"].typeText("foo@yandex.ru")
        app.secureTextFields["Введите пароль"].tap()
        app.secureTextFields["Введите пароль"].typeText("qazXSW1")
        app.secureTextFields["Повторите пароль"].tap()
        app.secureTextFields["Повторите пароль"].typeText("qazXSW1")
        app/*@START_MENU_TOKEN@*/.staticTexts["Зарегистрироваться"]/*[[".buttons[\"Зарегистрироваться\"].staticTexts[\"Зарегистрироваться\"]",".staticTexts[\"Зарегистрироваться\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Введите e-mail"].tap()
        app.secureTextFields["Введите пароль"].tap()
        app.buttons["Авторизироваться"].tap()
    }

}
