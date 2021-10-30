//
//  uplifthingsUITests.swift
//  uplifthingsUITests
//
//  Created by Alfred  Lucero on 10/20/21.
//

import XCTest

class uplifthingsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEditClearFlow() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        let textView = tablesQuery.cells["1."].children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .textView).element
        XCTAssertFalse(textView.isEnabled)
        textView.tap()
        
        app.buttons["Edit"].tap()
        app.buttons["Clear"].tap()
        XCTAssertFalse(app.buttons["Edit"].exists)
        XCTAssertTrue(app.buttons["Done"].exists)
        XCTAssertTrue(app.buttons["Clear"].exists)
        
        XCTAssertTrue(textView.isEnabled)
        textView.tap()
        textView.typeText("First uplifthing")
        XCTAssertEqual(textView.value as! String, "First uplifthing", "Should have first uplifthing")

        
        app.buttons["Clear"].tap()
        
        XCTAssertEqual(textView.value as! String, "", "Should be empty")
        
        app.buttons["Done"].tap()
        XCTAssertFalse(app.buttons["Done"].exists)
        XCTAssertTrue(app.buttons["Edit"].exists)
     
        XCTAssertFalse(textView.isEnabled)
    }

    func testEditSaveFlow() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        let textView = tablesQuery.cells["1."].children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .textView).element
        XCTAssertFalse(textView.isEnabled)
        textView.tap()
        
        app.buttons["Edit"].tap()
        XCTAssertFalse(app.buttons["Edit"].exists)
        XCTAssertTrue(app.buttons["Done"].exists)
        XCTAssertTrue(app.buttons["Clear"].exists)
        
        XCTAssertTrue(textView.isEnabled)
        textView.tap()
        textView.typeText("First uplifthing")
        
        let textView2 = tablesQuery.cells["2."].children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .textView).element
        XCTAssertTrue(textView2.isEnabled)
        textView2.tap()
        textView2.typeText("Second uplifthing")
        app.buttons["Done"].tap()
        
        XCTAssertFalse(app.buttons["Done"].exists)
        XCTAssertTrue(app.buttons["Edit"].exists)
        
        XCTAssertFalse(textView.isEnabled)
        XCTAssertFalse(textView2.isEnabled)
    }
    
    func testEditAndRelaunchWithSavedData() {
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        let textView = tablesQuery.cells["1."].children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .textView).element
        
        app.buttons["Edit"].tap()
        app.buttons["Clear"].tap()
    
        let savedUplifthing = "Saving to phone defaults"
        textView.tap()
        textView.typeText(savedUplifthing)
        app.buttons["Done"].tap()
        
        app.terminate()
        
        app.launch()
        let newTablesQuery = app.tables
        let newTextView = tablesQuery.cells["1."].children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .textView).element
        
        XCTAssertEqual(newTextView.value as! String, savedUplifthing, "Should be saved still after terminating and relaunching the app")
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
