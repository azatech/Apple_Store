//
//  ProductDetailTableViewController.swift
//  rock-paper-scissors
//
//  Created by Azat IOS on 15.12.2017.
//  Copyright © 2017 Azat IOS. All rights reserved.
//

import UIKit

class ProductDetailTableViewController: UITableViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleTextfield: UITextField!
    @IBOutlet weak var productDescriptionTextView: UITextView!

    var product: Product? = ProductLine.getProductLines()[0].products[0]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Assignig all the properties to the outlet
        productImageView.image = product?.image
        productTitleTextfield.text = product?.title
        productDescriptionTextView.text = product?.description
        
    }
}
