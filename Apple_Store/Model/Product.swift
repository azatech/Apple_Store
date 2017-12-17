//
//  Product.swift
//  rock-paper-scissors
//
//  Created by Azat IOS on 14.12.2017.
//  Copyright © 2017 Azat IOS. All rights reserved.
//

// product Line will contain [Product]

import UIKit

// Rating of Product
enum ProductRating {
    case unrated
    case average
    case ok
    case good
    case brilliant
}

class Product {
    var image: UIImage
    var title: String
    var description: String

    // we using enum type Enum --> Productrating
    var rating: ProductRating

    // Nachalnye znacheniya
    init(titled: String, description: String, imageName: String) {
        self.title = titled
        self.description = description
        if let image = UIImage(named: imageName) {
            self.image = image
        } else {
            //
            self.image = UIImage(named: "default")!
        }
        // default init = unrated
        self.rating = .unrated
    }

}
