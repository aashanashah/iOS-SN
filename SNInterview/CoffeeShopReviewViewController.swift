//
//  CoffeeShopReviewViewController.swift
//  SNInterview
//
//  Created by Aashana Shah on 10/15/21.
//  Copyright © 2021 ServiceNow. All rights reserved.
//

import UIKit

class CoffeeShopReviewViewController: UIViewController {
    @IBOutlet weak var reviewLabel: UILabel!
    var reviewText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        reviewLabel.text = reviewText
        // Do any additional setup after loading the view.
    }
}
