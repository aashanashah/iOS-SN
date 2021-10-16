//
//  SNInterviewTests.swift
//  SNInterviewTests
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import XCTest
@testable import SNInterview

class SNInterviewTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoffeeShop() {
        let coffeeShop = CoffeeShop(name: "Test Coffee", review: "Test Review", rating: 1)
        XCTAssertEqual(coffeeShop.name, "Test Coffee")
        XCTAssertEqual(coffeeShop.review, "Test Review")
        XCTAssertEqual(coffeeShop.rating, 1)
        
        let dict: [String: Any] = ["name": "Test Coffee 2", "review": "Test Review 2", "rating": 3]
        let coffeeShopFromDict = CoffeeShop(from: dict)
        XCTAssertEqual(coffeeShopFromDict.name, "Test Coffee 2")
        XCTAssertEqual(coffeeShopFromDict.review, "Test Review 2")
        XCTAssertEqual(coffeeShopFromDict.rating, 3)
    }
    
    func testLoadFromJSON() {
        // Done in CoffeeShopReviewModelTests
    }
    
}
