//
//  CoffeeShopReviewModel.swift
//  SNInterview
//
//  Created by Aashana Shah on 10/15/21.
//  Copyright © 2021 ServiceNow. All rights reserved.
//

import Combine
import UIKit

protocol CoffeeShopModelDelegate: NSObject {
    func notifyDataChange()
}

class CoffeeShopReviewModel {
    var reviews = [CoffeeShop]()
    weak var delegate: CoffeeShopModelDelegate?
    
    func fetchReviews() -> [CoffeeShop] {
        var fetchedReviews = [CoffeeShop]()
        if let filePath = Bundle.main.path(forResource: "CoffeeShops", ofType: "json") {
            let url = URL(fileURLWithPath: filePath)
            do {
                let fetchedData = try Data(contentsOf: url, options: .mappedIfSafe)
                let jsonData = try JSONSerialization.jsonObject(with: fetchedData, options: [])
                if let arrayDict = jsonData as? [[String: Any]] {
                    for review in arrayDict {
                        fetchedReviews.append(CoffeeShop(from: review))
                    }
                }
            } catch {
                print("error fetching data")
            }
        }
        
        delegate?.notifyDataChange()
        return fetchedReviews
    }
}

struct CoffeeShop {
    let name: String
    let review: String
    let rating: Int
    
    init(name: String, review: String, rating: Int) {
        self.name = name
        self.review = review
        self.rating = rating
    }
    
    init(from dict: [String:Any]) {
        let name = dict["name"] as? String ?? ""
        let review = dict["review"] as? String ?? ""
        let rating = dict["rating"] as? Int ?? 0
        
        self.name = name
        self.review = review
        self.rating = rating
    }
}

