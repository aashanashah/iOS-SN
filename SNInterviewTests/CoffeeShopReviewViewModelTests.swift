//
//  CoffeeShopReviewViewModelTests.swift
//  SNInterviewTests
//
//  Created by Aashana Shah on 10/16/21.
//  Copyright © 2021 ServiceNow. All rights reserved.
//

import XCTest
@testable import SNInterview

class CoffeeShopReviewViewModelTests: XCTestCase, CoffeeShopReviewViewModelDelegate {
    let viewModel = CoffeeShopReviewViewModel(model: CoffeeShopReviewModel())

    func testReviews() {
        XCTAssertEqual(viewModel.numberOfRows, 5)
        
        for i in 0..<viewModel.numberOfRows {
            XCTAssertEqual(viewModel.review(for: i).name, viewModel.reviews[i].name)
            XCTAssertEqual(viewModel.review(for: i).review, viewModel.reviews[i].review)
            XCTAssertEqual(viewModel.review(for: i).rating, viewModel.reviews[i].rating)
        }
    }
    
    func testDelegate() {
        viewModel.delegate = self
        viewModel.reviews = [CoffeeShop]()
        viewModel.delegate = nil
        viewModel.reviews = viewModel.model.fetchReviews()
    }
    
    func notifyDataChange() {
        XCTAssertEqual(viewModel.reviews.count, 0)
    }
}
