//
//  script_manager_appleTests.swift
//  script manager appleTests
//
//  Created by 黄继辉 on 2022/7/6.
//

import XCTest
import script_manager_apple

class script_manager_appleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testClipBoard() throws {
        writeToClipboard(string:"s")
    }
    
//    func testNotification() throws {
//        sendNotification(string: "123")
//    }
    
//    func testDB() throws {
//        let data = "hello world"
//        let key = "key"
//        NSUserDefaultsController().defaults.set(data, forKey:key)
//        var newData = NSUserDefaultsController().defaults.object(forKey: key)
//        debugPrint(newData)
//        NSUserDefaultsController().defaults.set("not happy", forKey: key)
//        newData = NSUserDefaultsController().defaults.object(forKey: key)
//        debugPrint(newData)
//
//    }
//    func testAddScript() throws {
//        let s = ModelData().addScript(script: "aaa")
//    }
}
