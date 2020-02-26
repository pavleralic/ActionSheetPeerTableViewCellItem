//
//  ActionSheetPeerTableViewCellItemTests.swift
//  ActionSheetPeerTableViewCellItemTests
//
//  Created by Pavle Ralic on 2/26/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import XCTest
@testable import ActionSheetPeerTableViewCellItem

class ActionSheetPeerTableViewCellItemTests: XCTestCase {

    var swiftyLib: ActionSheetPeerTableViewCellItem!

    override func setUp() {
        swiftyLib = ActionSheetPeerTableViewCellItem()
    }

    func testAdd() {
        XCTAssertEqual(swiftyLib.add(a: 1, b: 1), 2)
    }
    
//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
