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
    var name = ""
    var reviewText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backButtonTitle = "Back"
        title = name

        reviewLabel.text = reviewText
        // Do any additional setup after loading the view.
    }
}
