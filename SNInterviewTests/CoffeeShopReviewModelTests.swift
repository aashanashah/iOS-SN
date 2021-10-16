//
//  CoffeeShopReviewModelTests.swift
//  SNInterviewTests
//
//  Created by Aashana Shah on 10/16/21.
//  Copyright © 2021 ServiceNow. All rights reserved.
//

import XCTest
@testable import SNInterview

class CoffeeShopReviewModelTests: XCTestCase {
    let model = CoffeeShopReviewModel()

    func testLoadFromJSON() {
        let reviews = model.fetchReviews()
        XCTAssertEqual(reviews.count, 5)
    }
}
