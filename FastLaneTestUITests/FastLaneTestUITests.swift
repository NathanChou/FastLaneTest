//
//  FastLaneTestUITests.swift
//  FastLaneTestUITests
//
//  Created by 周彥宏 on 2018/12/5.
//  Copyright © 2018 周彥宏. All rights reserved.
//

import XCTest

class FastLaneTestUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    
    func testInvalidLogin_progressSpinnerIsHidden() {
        
        let app = XCUIApplication()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        app.buttons["Login"].tap()
        app.alerts["Missing Credentials"].buttons["Ok"].tap()
        
        let activityIndicatorView = app.activityIndicators["In progress"];
        XCTAssertFalse(activityIndicatorView.exists)
    }
    
    
    
    func testInvalidLogin_missingCredentialsAlertIsShown() {
        
        let app = XCUIApplication()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        app.textFields["Username"].tap()
        app.buttons["Login"].tap()
        
        let alertDialog = app.alerts["Missing Credentials"];
        
        XCTAssertTrue(alertDialog.exists);
        
        alertDialog.buttons["Ok"].tap();
        
    }

    
    func testValidLoginSuccess() {
        
        let validPassword = "abc123"
        let validUserName = "CodePro"
        
        let app = XCUIApplication()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap();
        
        let userNameTextField = app.textFields["Username"];
        XCTAssertTrue(userNameTextField.exists);
        userNameTextField.tap();
        userNameTextField.typeText(validUserName);
        
        let passwordTextField = app.secureTextFields["Password"];
        XCTAssertTrue(passwordTextField.exists);
        passwordTextField.tap();
        passwordTextField.typeText(validPassword);
        
        app.buttons["Login"].tap();
        
        let downloadsCell = app.tables.staticTexts["My Downloads"]
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: downloadsCell, handler: nil);
        waitForExpectations(timeout: 5, handler: nil);
        XCTAssertTrue(downloadsCell.exists);
    }
    
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
