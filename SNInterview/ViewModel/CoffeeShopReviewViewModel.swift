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

class CoffeeShopReviewViewModel: NSObject, CoffeeShopModelDelegate {
    
    // made weak to avoid retain cycles
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
        
        model.delegate = self
        reviews = model.fetchReviews()
    }
    
    func notifyDataChange() {
        reviews = model.reviews
    }
    
    func mapToCoffeeShop(from dict: [String:Any]) -> CoffeeShop {
        let name = dict["name"] as? String ?? ""
        let review = dict["review"] as? String ?? ""
        let rating = dict["rating"] as? Int ?? 0
        
        return CoffeeShop(name: name, review: review, rating: rating)
    }
}
