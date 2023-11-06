//
//  Fetch_iOSCodingUITests.swift
//  Fetch_iOSCodingUITests
//
//  Created by Soyeon Lee on 10/31/23.
//

import XCTest
@testable import Fetch_iOSCoding

final class Fetch_iOSCodingUITests: XCTestCase {
    

    func testApp() throws {
        let app = XCUIApplication()
        app.launch()

        // Test main view launches correctly by looking for a welcome text.
        let welcomeText = app.staticTexts["What are you in the mood to make today?"]
        XCTAssert(welcomeText.exists)
        
        // Test that meal list is loading correctly by looking for a first meal item.
        let firstMealItemText = app.staticTexts["Apam balik"]
        XCTAssert(firstMealItemText.waitForExistence(timeout: 5))
        
        // Test that tapping on a meal list item navigates and load meal detail view correctly by looking for static text "Ingredients" which only appears when meal detail data is available.
        firstMealItemText.tap()
        let ingredientsText = app.staticTexts["Ingredients"]
        XCTAssert(ingredientsText.exists)
    }
}
