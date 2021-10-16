//
//  CoffeeShopReviewViewModel.swift
//  SNInterview
//
//  Created by Aashana Shah on 10/15/21.
//  Copyright © 2021 ServiceNow. All rights reserved.
//

import UIKit

// if the data is being changed, added a delegate to notify to the viewcontroller that the data was updated
protocol CoffeeShopReviewViewModelDelegate: NSObject {
    func notifyDataChange()
}

class CoffeeShopReviewViewModel: NSObject {
    
    // made weak to avoid retain cycles
    // would have used combine if the target version was 13 and above
    weak var delegate: CoffeeShopReviewViewModelDelegate?
    let model: CoffeeShopReviewModel
    
    // if reviews change, notify it
    var reviews = [CoffeeShop]() {
        didSet {
            delegate?.notifyDataChange()
        }
    }
    
    init(model: CoffeeShopReviewModel) {
        self.model = model
        super.init()
        
        reviews = model.fetchReviews()
    }
    
    func notifyDataChange() {
        reviews = model.reviews
    }
}
