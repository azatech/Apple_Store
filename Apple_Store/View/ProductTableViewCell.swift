//
//  ProductTableViewCell.swift
//  rock-paper-scissors
//
//  Created by Azat IOS on 14.12.2017.
//  Copyright © 2017 Azat IOS. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!


    var product: Product? {
        didSet {
            self.updateUI()
        }
    }

    func updateUI() {
        productImageView.image = product?.image
        productTitleLabel.text = product?.title
        productDescriptionLabel.text = product?.description

    }
}
